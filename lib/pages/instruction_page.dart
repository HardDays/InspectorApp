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
import 'package:inspector/model/report.dart';
import 'package:inspector/pages/digg_report_page.dart';
import 'package:inspector/pages/total_report_page.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/card.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/status.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/widgets/instruction/status.dart';
import 'package:inspector/style/paragraph.dart';
import 'package:intl/intl.dart';

class InstructionPage extends StatelessWidget {

  final Instruction instruction;

  InstructionPage(this.instruction);

  void _onTotalReport(BuildContext context, Report report, InstructionCheck check) async {
    bool violationNotPresent = false;
    if (report == null) {
      violationNotPresent = await _showViolationDialog(context);
    } 
    if (violationNotPresent != null) {
      final res = await Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => TotalReportPage(
            report: report?.copyWith() ?? Report.empty(violationNotPresent, check.id, instruction.id)
          ),
        ),
      );  
      if (res != null) {
        BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
      }
    }
  }

  void _onAddressReport(BuildContext context, DiggRequestCheck diggRequestCheck, Report report, String status) async {
    final res = await Navigator.push(context, MaterialPageRoute(builder: (context) => DiggReportPage(diggRequestCheck, report, status)));
     if (res != null) {
      BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
    }
  }

  void _onStatus(BuildContext context, int status) {
    BlocProvider.of<InstructionBloc>(context).add(UpadteInstructionStatusEvent(status));  
  }

  void _onRefreshReport(BuildContext context) {
    BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
  }

  void _showSnackBar(BuildContext context, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_) => 
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ProjectColors.darkBlue,
          content: Text(title),
          duration: Duration(seconds: 5),
        ),
      ),
    );
  }

  Future<bool> _showViolationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => ProjectDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectButton.buildOutlineButton('Без нарушения',
              color: ProjectColors.green,
              onPressed: ()=> Navigator.pop(context, true)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
            ),
            ProjectButton.buildOutlineButton('С нарушением ',
              color: ProjectColors.red,
              onPressed: ()=> Navigator.pop(context, false)
            ),
          ],
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
      create: (context)=> InstructionBloc(InstructionBlocState(null, instruction, []))..add(LoadReportsEvent()),
      child: BlocBuilder<InstructionBloc, InstructionBlocState>(
        builder: (context, state) {
          if (state is SuccessState) { 
            _showSnackBar(context, 'Данные обновлены');
            _flush(context);
          } else if (state is ErrorState) {
            _showSnackBar(context, 'Произошла ошибка. ${state.exception.message} ${state.exception.details}');
            _flush(context);
          } 

          final instruction = state.instruction;
          return Scaffold(
            appBar: ProjectAppbar('Поручение № ${instruction.instructionNum} от ${DateFormat('dd.MM.yyyy').format(instruction.instructionDate)}'),
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
                    _buildSection('Срок предоставления документов, фиксирующих факты и события нарушения', DateFormat('dd.MM.yyyy').format(instruction.reportDate)),
                    Column(
                      children: List.generate(instruction.instructionChecks.length, 
                        (index) => _buildInstructionCheck(context, 
                          instruction.instructionChecks[index], 
                          index < state.reports.length ? state.reports[index] : null, 
                          instruction
                        ),
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
    return Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(top: 20),
      child: ProjectStatus(
        checkStatus.name,
        rightBorder: false,
        rounded: false,
        color: CheckStatusColors.color(checkStatus.id),
      ),
    );
  }

  Widget _buildAddress(Address address, bool line) {
    final suggestion = address.specifiedAddress != null && address.specifiedAddress.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectParagraph(ProjectIcons.mapIcon(), address.toLongString(),
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
        ) : Container(),
      ],
    );
  }

  Widget _buildReportButton(BuildContext context, Report report, InstructionCheck check, Instruction instruction) {
    final state = BlocProvider.of<InstructionBloc>(context).state;
    final status = instruction.instructionStatus.id == InstructionStatusIds.inProgress || instruction.instructionStatus.id == InstructionStatusIds.partInProgress;
    if (state is LoadingReportsState || !status) {
      return Container();
    } else {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)), 
          ),
          SizedBox(
            height: 38,
            child: ProjectButton.builtFlatButton('+ Добавить рапорт ', 
              onPressed: ()=> _onTotalReport(context, report, check), 
              style: ProjectTextStyles.baseBold
            ),
          ),
        ],
      );
    } 
  }

  Widget _buildReport(BuildContext context, Report report, InstructionCheck check, Instruction instruction, Function onTap) {
    final state = BlocProvider.of<InstructionBloc>(context).state;
    if (report != null) {
      return Container(
        child: Row(
          children: [
            ProjectIcons.raportIcon(color: ProjectColors.mediumBlue),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: onTap,
                child: IntrinsicWidth(
                  child: Column(
                    children: [
                      Text('Рапорт № ${report.reportNum} от ${report.reportDate != null ? DateFormat('dd.MM.yyyy').format(report.reportDate) : ''}',
                        style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
                      ),
                      Container(
                        height: 1,
                        color: ProjectColors.blue
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: ProjectStatus(report.reportStatus.name, 
                color: ReportStatusColors.color(report.reportStatus.id)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(state.date != null ? DateFormat('dd.MM.yyyy HH:mm').format(state.date) : 'Не обновлялось',
                style: ProjectTextStyles.baseBold.apply(color: ProjectColors.black)
              ),
            ),
            InkWell(
              onTap: ()=> _onRefreshReport(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Icon(Icons.refresh,
                  size: 20,
                  color: ProjectColors.darkBlue
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      if (state is LoadingReportsState) {
        return Container();
      } else {
        return _buildReportButton(context, report, check, instruction);
      }
    }
  }

  Widget _buildSplitter(BuildContext context, int count) {
    if (count > 0) {
      return Container(
        color: ProjectColors.darkBlue,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
        child: Text('Обследование факта окончания работ и восстановления благоустройства',
          style: ProjectTextStyles.baseBold.apply(color: Colors.white),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 15),
      );
    }
  }

  Widget _buildDiggReuestCheck(BuildContext context, Report report, InstructionCheck check, DiggRequestCheck diggRequestCheck, bool divider) {
    final enabled = report != null && 
                    report.reportStatus.id != ReportStatusIds.onApproval && 
                    report.reportStatus.id != ReportStatusIds.accepted &&
                    (instruction.instructionStatus.id == InstructionStatusIds.inProgress ||
                    instruction.instructionStatus.id == InstructionStatusIds.partComplete ||
                    instruction.instructionStatus.id == InstructionStatusIds.partInProgress);
    String status;
    if (diggRequestCheck.workCompleted) {
      if (diggRequestCheck.landscapingRestored) {
        status = DiggRequestCheckStatus.landscapingRestored;
      } else {
        status = DiggRequestCheckStatus.landscapingNotRestored;
      }
    } else {
      status = DiggRequestCheckStatus.workNotComplete;
    }
    return ClipRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Slidable(
          actionExtentRatio: 0.17,
          actionPane: SlidableDrawerActionPane(),
          child: Stack(
            children: [
              Padding(
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
                    report?.diggRequestChecks?.any((e) => e.id == diggRequestCheck.id) ?? false ?
                    Padding(
                      padding: const EdgeInsets.only(top: 15), 
                      child: _buildReport(context, report, check, instruction, ()=> _onAddressReport(context, diggRequestCheck, report, status))
                     ) : Container(),
                    divider ? ProjectDivider() : Container(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: ProjectStatus(status,
                    color: DiggRequestCheckColors.color(diggRequestCheck.workCompleted, diggRequestCheck.landscapingRestored),
                    rightBorder: false,
                    rounded: false,
                  ),
                ),
              ),
            ],
          ),
          enabled: enabled,
          secondaryActions: [
            _buildAction(context,
              diggRequestCheck,
              report,
              DiggRequestCheckStatus.workNotComplete,
              Icon(Icons.not_interested,
                color: ProjectColors.black,
                size: 20,
              ),
              'Работы не\nзавершены',
            ),
            _buildAction(context,
              diggRequestCheck,
              report,
              DiggRequestCheckStatus.landscapingNotRestored,
              Icon(Icons.close,
                color: ProjectColors.red,
                size: 26,
              ),
              'Благоустройство\nне восстановлено',
            ),
            _buildAction(context,
              diggRequestCheck,
              report,
              DiggRequestCheckStatus.landscapingRestored,
              Icon(Icons.check,
                color: ProjectColors.green,
                size: 26,
              ),
              'Благоустройство\nвосстановлено',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, DiggRequestCheck diggRequestCheck, Report report, String status, Widget icon, String text) {
    return InkWell(
      onTap: ()=> _onAddressReport(context, diggRequestCheck, report, status),
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

  Widget _buildInstructionCheck(BuildContext context, InstructionCheck instructionCheck, Report report, Instruction instruction) {
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
              _buildParagraph(ProjectIcons.themeIcon(), instructionCheck.checkSubject),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
                child: _buildReport(context, report, instructionCheck, instruction, ()=> _onTotalReport(context, report, instructionCheck))
              ),
              _buildSplitter(context, instructionCheck.diggRequestChecks.length),
              Column(
                children: List.generate(instructionCheck.diggRequestChecks.length, 
                  (index) => _buildDiggReuestCheck(context, report, instructionCheck, instructionCheck.diggRequestChecks[index], index < instructionCheck.diggRequestChecks.length - 1),
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
      InstructionStatusIds.assigned: 'Принять на исполнение',
      InstructionStatusIds.complete: 'Заверешно',
      InstructionStatusIds.withdrawn: 'Отозвано',
      InstructionStatusIds.inProgress: 'Подтвердить исполнение',
      InstructionStatusIds.partInProgress: 'Подтвердить исполнение',
      InstructionStatusIds.partComplete: 'Подтвердить исполнение',
    };
    final functions = {
      InstructionStatusIds.assigned: ()=> _onStatus(context, InstructionStatusIds.inProgress),
      InstructionStatusIds.complete: null,
      InstructionStatusIds.withdrawn: null,
      InstructionStatusIds.inProgress: ()=> _onStatus(context, InstructionStatusIds.complete),
      InstructionStatusIds.partInProgress: ()=> _onStatus(context, InstructionStatusIds.complete),
      InstructionStatusIds.partComplete: ()=> _onStatus(context, InstructionStatusIds.complete),
    };
    final instruction = state.instruction;
    if (state is LoadingUpdateState) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(ProjectColors.darkBlue),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          instruction.instructionStatus.id == InstructionStatusIds.assigned ? Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ProjectButton.buildOutlineButton('Отклонить',
              onPressed: ()=> _onStatus(context, InstructionStatusIds.withdrawn)
            ),
          ) : Container(),
          ProjectButton.builtFlatButton(titles[instruction.instructionStatus.id] ?? 'Подтвердить исполнение',
            onPressed: functions[instruction.instructionStatus.id],
          ),
        ]
      );
    }
  }
}
