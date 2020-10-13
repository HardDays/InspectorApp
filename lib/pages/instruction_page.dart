import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/blocs/instruction/bloc.dart';
import 'package:inspector/blocs/instruction/events.dart';
import 'package:inspector/blocs/instruction/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_check.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/pages/address_report_page.dart';
import 'package:inspector/pages/total_report_page.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/widgets/instruction/status.dart';
import 'package:inspector/style/paragraph.dart';
import 'package:intl/intl.dart';

class InstructionPage extends StatelessWidget {

  // todo: сделать нормально (enum и тд, как в api)
  final Instruction instruction;

  InstructionPage(this.instruction);

  void _onTotalReport(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TotalReportPage('Назначено')));
  }

  void _onAddressReport(BuildContext context, String status) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddressReportPage(status)));
  }

  void _onStatus(BuildContext context, String status) {
    BlocProvider.of<InstructionBloc>(context).add(UpadteInstructionStatusEvent(status));  
  }

  void _showSnackBar(BuildContext context, String title, Color color) {
    WidgetsBinding.instance.addPostFrameCallback((_) => 
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ProjectColors.darkBlue,
          content: Text(title),
        ),
      ),
    );
  }

  void _flush(BuildContext context) {
    BlocProvider.of<InstructionBloc>(context).add(FlushEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InstructionBloc(InstructionBlocState(instruction))..add(LoadReportsEvent()),
      child: BlocBuilder<InstructionBloc, InstructionBlocState>(
        builder: (context, state) {
          if (state is SuccessState) { 
            _showSnackBar(context, 'Успешно', ProjectColors.green);
            _flush(context);
          } else if (state is ErrorState) {
            _showSnackBar(context, 'Произошла ошибка. ${state.exception.message}  ${state.exception.details}', ProjectColors.yellow);
            _flush(context);
          } 

          final instruction = state.instruction;
          return Scaffold(
            appBar: ProjectAppbar('Поручение № ${instruction.instructionNum} от ${instruction.instructionDate}'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    _buildStatus(instruction),
                    _buildSection('Способ наблюдения', toBeginningOfSentenceCase(instruction.checkType.name)),
                    Column(
                      children: List.generate(instruction.normativeActs.length, 
                        (index) => _buildSection('Нормативно-правовой акт', instruction.normativeActs[index].name),
                      ),
                    ),
                    _buildSection('Срок предоставления документов, фиксирующих факты и события нарушения', instruction.reportDate),
                    Column(
                      children: List.generate(instruction.instructionChecks.length, 
                        (index) => _buildInstructionCheck(context, instruction.instructionChecks[index], instruction),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: _buildCompleteButton(context, state),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );
  }

  Widget _buildStatus(Instruction instruction) {
    return ProjectSection('Статус поручения',
      child: InstructionStatusWidget(instruction.instructionStatus),
    );
  }

  Widget _buildSection(String title, String description) {
    if (description != null && description.isNotEmpty) {
      return ProjectSection(title,
        description: description,
      );
    } else {
      return Container();
    }
  }

  Widget _buildParagraph(Widget icon, String title) {
    if (title != null && title.isNotEmpty) {
      return ProjectParagraph(icon, title,
        padding: const EdgeInsets.only(top: 15, left: 18, right: 20)
      );
    } else {
      return Container();
    }
  }

  Widget _buildInstructionCheckStatus(CheckStatus checkStatus) {
    // todo: new colors map
    final color = InstructionStatusColors.color(checkStatus.name);
    return Container(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color), top: BorderSide(color: color), bottom: BorderSide(color: color)),
        ),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
        margin: const EdgeInsets.only(top: 20),
        child: Text(checkStatus.name,
          style: ProjectTextStyles.smallBold.apply(color: color),
        ),
      ),
    );
  }

  Widget _buildReportButton(BuildContext context, Instruction instruction) {
    if (instruction.instructionStatus.name == InstructionStatusStrings.inProgress || instruction.instructionStatus.name == InstructionStatusStrings.partInProgress) {
      return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 10),
              child: ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)), 
            ),
            SizedBox(
              height: 38,
              child: ProjectButton.builtFlatButton('+ Добавить рапорт ', onPressed: ()=> _onTotalReport(context), style: ProjectTextStyles.baseBold),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildAddress(Address address, bool line) {
    final suggestion = address.specifiedAddress != null && address.specifiedAddress.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectParagraph(ProjectIcons.mapIcon(), address.toString(),
          maxLines: 1,
          padding: const EdgeInsets.only(left: 18, right: 20)
        ),
        suggestion ? Row(
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: line ? CrossAxisAlignment.center : CrossAxisAlignment.end,
                children: [
                  Container(
                    height: line ? 40 : 20,
                    width: 2,
                    margin: EdgeInsets.only(left: 28, bottom: line ? 0 : 10),
                    color: ProjectColors.mediumBlue,
                  ),
                  Container(
                    height: 2,
                    width: 30,
                    color: ProjectColors.mediumBlue,
                    margin: EdgeInsets.only(bottom: line ? 0 : 10),
                  ),
                  Flexible(
                    child: ProjectParagraph(ProjectIcons.pointIcon(), address.specifiedAddress,
                      maxLines: 1,
                      padding: EdgeInsets.only(right: 20, top: line ? 0 : 10),
                      color: ProjectColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) : Container(),
        line && !suggestion ? Container(
          height: 15,
          width: 2,
          margin: const EdgeInsets.only(left: 28),
          color: ProjectColors.mediumBlue,
        ) : Container()
      ],
    );
  }

  Widget _buildSplitter(BuildContext context) {
    return Container(
      color: ProjectColors.darkBlue,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
      child: Text('Обследование факта окончания работ и восстановления благоустройства',
        style: ProjectTextStyles.baseBold.apply(color: Colors.white),
      ),
    );
  }

  Widget _buildDiggReuestCheck(BuildContext context, DiggRequestCheck diggRequestCheck, bool divider) {
    return ClipRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Slidable(
          actionExtentRatio: 0.17,
          actionPane: SlidableDrawerActionPane(),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 19, left: 19, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(diggRequestCheck.diggNum,
                    style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(diggRequestCheck.diggAddress,
                    style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                  ),
                ),
                divider ? ProjectDivider() : Container(),
                // showRaport  ? Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: Row(
                //     children: [
                //       ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 10),
                //         child: Text('Рапорт № 20-61-К21 от 11.03.2020',
                //           style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue, decoration: TextDecoration.underline),
                //         ),
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //           border: Border.all(color: ProjectColors.yellow),
                //           borderRadius: BorderRadius.circular(5)
                //         ),
                //         margin: const EdgeInsets.only(left: 10, right: 10),
                //         padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                //         child: Text('На согласовании',
                //           style: ProjectTextStyles.smallBold.apply(color: ProjectColors.yellow),
                //         ),
                //       ),
                //       Text(DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                //         style: ProjectTextStyles.baseBold.apply(color: ProjectColors.black),
                //       )
                //     ],
                //   ),
                // ) : Container(),
              ],
            ),
          ),
          // enabled: instruction.instructionStatus.name == 'На исполнении',
          secondaryActions: [
            _buildAction(
              context,
              Icon(Icons.not_interested,
                color: ProjectColors.black,
                size: 20,
              ),
              'Работы не\nзавершены',
              'Работы не завершены'
            ),
            _buildAction(
              context,
              Icon(Icons.close,
                color: ProjectColors.red,
                size: 26,
              ),
              'Благоустройство\nне восстановлено',
              'Благоустройство не восстановлено'
            ),
            _buildAction(
              context,
              Icon(Icons.check,
                color: ProjectColors.green,
                size: 26,
              ),
              'Благоустройство\nвосстановлено',
              'Благоустройство восстановлено'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, Widget icon, String text, String status) {
    return InkWell(
      onTap: ()=> _onAddressReport(context, status),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(right: BorderSide(color: ProjectColors.lightBlue))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionCheck(BuildContext context, InstructionCheck instructionCheck, Instruction instruction) {
    return ProjectCard(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildParagraph(ProjectIcons.inspectorIcon(), toBeginningOfSentenceCase(instruction.instructionCreator.formattedName)),
              Column(
                children: List.generate(instructionCheck.checkParticipants.length, 
                  (index) => _buildParagraph(ProjectIcons.inspector2Icon(),  instructionCheck.checkParticipants[index].toString()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: List.generate(instructionCheck.checkAddresses.length, 
                    (index) => _buildAddress(instructionCheck.checkAddresses[index], index < instructionCheck.checkAddresses.length - 1),
                  ),
                ),
              ),
              //_buildParagraph(ProjectIcons.pointIcon(), instructionCheck.checkAddresses.first.),
              _buildParagraph(ProjectIcons.themeIcon(), instructionCheck.checkSubject),
              _buildReportButton(context, instruction),
              _buildSplitter(context),
              Column(
                children: List.generate(instructionCheck.diggRequestChecks.length, 
                  (index) => _buildDiggReuestCheck(context, instructionCheck.diggRequestChecks[index], index < instructionCheck.diggRequestChecks.length - 1),
                ),
              ),
            ],
          ),
          _buildInstructionCheckStatus(instructionCheck.checkStatus)
        ],
      ),
    );
  }

  Widget _buildCompleteButton(BuildContext context, InstructionBlocState state) {
    final titles = {
      InstructionStatusStrings.assigned: 'Принять на исполнение',
      InstructionStatusStrings.complete: 'Заверешно',
      InstructionStatusStrings.withdrawn: 'Отозвано',
      InstructionStatusStrings.inProgress: 'Подтвердить исполнение',
      InstructionStatusStrings.partInProgress: 'Подтвердить исполнение',
      InstructionStatusStrings.partComplete: 'Подтвердить исполнение',
    };
     final functions = {
      InstructionStatusStrings.assigned: ()=> _onStatus(context, InstructionStatusStrings.inProgress),
      InstructionStatusStrings.complete: null,
      InstructionStatusStrings.withdrawn: null,
      InstructionStatusStrings.inProgress: ()=> _onStatus(context, InstructionStatusStrings.complete),
      InstructionStatusStrings.partInProgress: ()=> _onStatus(context, InstructionStatusStrings.complete),
      InstructionStatusStrings.partComplete: ()=> _onStatus(context, InstructionStatusStrings.complete),
    };
    final instruction = state.instruction;
    if (state is LoadingState) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(ProjectColors.darkBlue),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          instruction.instructionStatus.name == InstructionStatusStrings.assigned ? Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ProjectButton.buildOutlineButton('Отклонить',
              onPressed: ()=> _onStatus(context, InstructionStatusStrings.withdrawn)
            ),
          ) : Container(),
          ProjectButton.builtFlatButton(titles[instruction.instructionStatus.name] ?? 'Подтвердить исполнение',
            onPressed: functions[instruction.instructionStatus.name],
          ),
        ]
      );
    }
  }
}
