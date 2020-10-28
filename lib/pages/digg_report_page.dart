import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/digg_report/bloc.dart';
import 'package:inspector/blocs/digg_report/events.dart';
import 'package:inspector/blocs/digg_report/states.dart';
import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/style/accept_dialog.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/radio.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:inspector/widgets/image_picker.dart';
import 'package:inspector/style/section.dart';

class DiggReportPage extends StatefulWidget {

  final DiggRequestCheck diggRequestCheck;
  final String status;
  final Report report;

  DiggReportPage(this.diggRequestCheck, this.report, this.status);

  @override
  DiggReportPageState createState() => DiggReportPageState();
}


class DiggReportPageState extends State<DiggReportPage> with SingleTickerProviderStateMixin {

  final _commentController = TextEditingController();

  final List<Uint8List> _photos = [

  ];

  void initState() {
    super.initState();

    DiggRequestCheck diggRequestCheck = widget.diggRequestCheck;
    final possible = widget.report.diggRequestChecks.where((e) => e.id == diggRequestCheck.id);
    if (possible.isNotEmpty) {
      diggRequestCheck = possible.first;
    }
    _commentController.text = diggRequestCheck.comment;

    final decoder = Base64Decoder();
    for (int i = 0; i < widget.report.photos.length; i++) {
      final image = decoder.convert(widget.report.photos[i].data);
      _photos.add(image);
    }
  }

   void _onPhotoPick(BuildContext context, File file) {
    _photos.add(file.readAsBytesSync());
    BlocProvider.of<DiggReportBloc>(context).add(FlushEvent());
  }

  void _onStatus(BuildContext context, String status) {
    BlocProvider.of<DiggReportBloc>(context).add(SetStatusEvent(status));  
  }

  void _onSave(BuildContext context, int status) async {
    final res = await showDialog(context: context, child: AcceptDialog(message: 'Сохранить рапорт?'));
    if (res != null) {
      BlocProvider.of<DiggReportBloc>(context).add(SaveReportEvent(widget.diggRequestCheck, status, _commentController.text));  
    }
  }

  void _onDeleteReport(BuildContext context) async {
    final res = await showDialog(context: context, child: AcceptDialog(message: 'Удалить рапорт?'));
    if (res != null) {
      BlocProvider.of<DiggReportBloc>(context).add(RemoveReportEvent());  
    }
  }

  void _showSnackBar(BuildContext context, String title) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ProjectColors.darkBlue,
            content: Text(title),
            duration: Duration(seconds: 5),
          ),
        );
        BlocProvider.of<DiggReportBloc>(context).add(FlushEvent());
      }
    );
  }

  void _back() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        Navigator.pop(context, true);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context)=> DiggReportBloc(DiggReportBlocState(widget.status, widget.report)),
      child: BlocBuilder<DiggReportBloc, DiggReportBlocState>(
        builder: (context, state) {
          if (state is SuccessState) { 
            _showSnackBar(context, 'Рапорт успешно сформирован');
            _back();
          } else if (state is DeletedState) { 
            _showSnackBar(context, 'Рапорт удален');
            _back();
          } else if (state is ErrorState) {
            _showSnackBar(context, 'Произошла ошибка. ${state.exception.message} ${state.exception.details}');
          }  
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ProjectAppbar('Рапорт ${widget.report.reportNum ?? ''}'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    ProjectTitle('Обследование факта окончания работ и восстановления благоустройства'),
                    ProjectSection('Номер разрытия', description: widget.diggRequestCheck.diggNum),
                    ProjectSection('Адрес', description: widget.diggRequestCheck.diggAddress),
                    ProjectTitle('Статус'),
                    ProjectRadio('Работы не завершены',
                      groupValue: state.status,
                      value: DiggRequestCheckStatus.workNotComplete,
                      onChanged: (value)=> _onStatus(context, value),
                    ),
                    ProjectRadio('Благоустройство не восстановлено',
                      groupValue: state.status,
                      value: DiggRequestCheckStatus.landscapingNotRestored,
                      onChanged: (value)=> _onStatus(context, value),
                    ),
                    ProjectRadio('Благоустройство восстановлено',
                      groupValue: state.status,
                      value: DiggRequestCheckStatus.landscapingRestored,
                      onChanged: (value)=> _onStatus(context, value),
                    ),
                    ProjectTitle('Комментарий'),
                    ProjectTextField(
                      hintText: 'Комментарий',
                      controller: _commentController,
                    ),
                    ProjectTitle('Фотоматериалы'),
                    ImagePicker(
                      margin: const EdgeInsets.only(top: 20, bottom: 70),
                      onPicked: (file)=> _onPhotoPick(context, file),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _buildButtons(context)
          );
        }
      )
    );
  }

  Widget _buildButtons(BuildContext context) {
    final report = widget.report;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectButton.builtFlatButton('Сохранить проект',
            onPressed: report.isNew ? () => _onSave(context, ReportStatusIds.project) : null,
          ),
          ProjectButton.builtFlatButton('Сохранить',
            onPressed: report.isNew ? ()=> _onSave(context, ReportStatusIds.new_) : null,
          ),
          ProjectButton.builtFlatButton('На согласование',
            onPressed: report.isUpdatable ? ()=>_onSave(context, ReportStatusIds.onApproval) : null,
          ),
          ProjectButton.builtFlatButton('Удалить', 
            color: ProjectColors.red,
            disabledColor: ProjectColors.red.withOpacity(0.3),
            onPressed: report.isDeletable ? ()=> _onDeleteReport(context) : null
          ),
        ],
      ),
    );
  }
}
