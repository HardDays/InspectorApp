import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/blocs/instruction/bloc.dart';
import 'package:inspector/blocs/instruction/events.dart';
import 'package:inspector/blocs/instruction/states.dart';
import 'package:inspector/blocs/instruction_list/bloc.dart';
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

  void _onReport(BuildContext context, int violationIndex, Report report, InstructionCheck check) async {
    final res = await Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => TotalReportPage(
          report: report,
          violationIndex: violationIndex,
        ),
      ),
    );  
    if (res != null) {
      BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
    }
  }

  void _onCreateReport(BuildContext context, InstructionCheck check) async {
     bool violationNotPresent = await _showViolationDialog(context);
     if (violationNotPresent != null) {
      final res = await Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => TotalReportPage(
            report: Report.empty(violationNotPresent, check.id, instruction.id),
            violationIndex: 0,
          ),
        ),
      );  
      if (res != null) {
        BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
      }
    }
  }

  void _onDiggReport(BuildContext context, DiggRequestCheck diggRequestCheck, Report report) async {
    final res = await Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) => 
          DiggReportPage(
            diggRequestCheck: diggRequestCheck,
            report: report
          )
        )
      );
     if (res != null) {
      BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
    }
  }

  void _onCreateDiggReport(BuildContext context, Instruction instruction, InstructionCheck check, DiggRequestCheck diggRequestCheck, String status) async {
    final res = await Navigator.push(context, 
      MaterialPageRoute(
        builder: (context) =>
          DiggReportPage(
            diggRequestCheck: diggRequestCheck, 
            report: Report.empty(true, check.id, instruction.id), 
            status: status
          )
        )
      );
     if (res != null) {
      BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent());  
    }
  }

  void _onStatus(BuildContext context, int status) {
    BlocProvider.of<InstructionBloc>(context).add(UpadteInstructionStatusEvent(status));  
  }

  void _onRefreshReport(BuildContext context) {
    BlocProvider.of<InstructionBloc>(context).add(RefreshReportsEvent(showMessage: true));  
  }

  void _showSnackBar(BuildContext context, String title) {
    WidgetsBinding.instance.addPostFrameCallback((_) => 
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ProjectColors.darkBlue,
          content: Text(title),
          duration: Duration(seconds: 3),
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
    print(instruction.id);

    return BlocProvider(
      create: (context)=> InstructionBloc(InstructionBlocState(null, instruction, []))..add(LoadReportsEvent()),
      child: BlocBuilder<InstructionBloc, InstructionBlocState>(
        builder: (context, state) {
          if (state is SuccessState && state.showMessage) { 
            _showSnackBar(context, 'Данные обновлены');
            _flush(context);
          } else if (state is ErrorState && state.showMessage) {
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
                          state.reports.where((element) => element.checkId == instruction.instructionChecks[index].id).toList(),
                          //index < state.reports.length ? state.reports[index] : null, 
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
      margin: const EdgeInsets.only(top: 15, right: 18),
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

  Widget _buildReload(BuildContext context) {
    final state = BlocProvider.of<InstructionBloc>(context).state;
    if (state is LoadingReportsState) {
      return Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(left: 10),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(ProjectColors.darkBlue),
        ),
      );
    } else {
      return Row(
        children: [
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
        ]
      );
    }
  }


  Widget _buildReportButton(BuildContext context, InstructionCheck check, Instruction instruction) {
    final status = instruction.instructionStatus.id == InstructionStatusIds.inProgress || instruction.instructionStatus.id == InstructionStatusIds.partInProgress;
    if (status) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 20),
            child: ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)), 
          ),
          SizedBox(
            height: 38,
            child: ProjectButton.builtFlatButton('+ Добавить рапорт ', 
              onPressed: ()=> _onCreateReport(context, check), 
              style: ProjectTextStyles.baseBold
            ),
          ),
         _buildReload(context)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildReport(BuildContext context, Report report, InstructionCheck check, Instruction instruction, Function onTap) {
    if (report != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
                padding: const EdgeInsets.only(left: 10, top: 2, right: 10),
                child: ProjectStatus(report.reportStatus.name, 
                  color: ReportStatusColors.color(report.reportStatus.id)
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildSplitter(BuildContext context, int count) {
    if (count > 0) {
      return Container(
        color: ProjectColors.darkBlue,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 20),
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

  Widget _buildDiggReuestCheck(BuildContext context, List<Report> reports, Instruction instruction, InstructionCheck check, DiggRequestCheck diggRequestCheck, bool divider) {
    Report report;
    final found = reports.where((e) => e.diggRequestChecks.any((d) => d.id == diggRequestCheck.id));
    if (found.isNotEmpty) {
      report = found.first;
    }
    final enabled = report == null &&
      // report.reportStatus.id != ReportStatusIds.onApproval && 
      // report.reportStatus.id != ReportStatusIds.accepted &&
      (instruction.instructionStatus.id == InstructionStatusIds.inProgress ||
      instruction.instructionStatus.id == InstructionStatusIds.partComplete ||
      instruction.instructionStatus.id == InstructionStatusIds.partInProgress);
    final status = diggRequestCheck.status;
    return ClipRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Slidable(
          actionExtentRatio: 0.22,
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
                      child: _buildReport(context, report, check, instruction, ()=> _onDiggReport(context, diggRequestCheck, report))
                     ) : Container(),
                    divider ? ProjectDivider() : Container(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, right: 18),
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
              instruction,
              check,
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
              instruction,
              check,
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
              instruction,
              check,
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

  Widget _buildAction(BuildContext context, Instruction instruction, InstructionCheck check, DiggRequestCheck diggRequestCheck, Report report, String status, Widget icon, String text) {
    return InkWell(
      onTap: ()=> _onCreateDiggReport(context, instruction, check, diggRequestCheck, status),
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

  Widget _buildCheckReports(BuildContext context,  InstructionCheck instructionCheck, List<Report> reports) {
    final reportList = List<Report>();
    final indexList = List<int>();
    for (final report in reports) {
      if (report.violations.isNotEmpty) {
        for (int i = 0; i < report.violations.length; i++) {
          indexList.add(i);
          reportList.add(report);
        }
      } else {
        indexList.add(0);
        reportList.add(report);
      }
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(reportList.length, 
          (index) => _buildReport(context, reportList[index], instructionCheck, instruction, ()=> _onReport(context, indexList[index], reportList[index], instructionCheck))
        ),
      ), 
    );
  }

  Widget _buildInstructionCheck(BuildContext context, InstructionCheck instructionCheck, List<Report> reports, Instruction instruction) {
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
              _buildCheckReports(context, instructionCheck, reports),
              _buildReportButton(context, instructionCheck, instruction),
              _buildSplitter(context, instructionCheck.diggRequestChecks.length),
              Column(
                children: List.generate(instructionCheck.diggRequestChecks.length, 
                  (index) => _buildDiggReuestCheck(context, reports, instruction, instructionCheck, instructionCheck.diggRequestChecks[index], index < instructionCheck.diggRequestChecks.length - 1),
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
      final canDecline = instruction.instructionStatus.id  == InstructionStatusIds.inProgress && 
                        (state.reports != null && state.reports.isEmpty) &&
                        !(state is LoadingReportsState);
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          canDecline ? Padding(
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
