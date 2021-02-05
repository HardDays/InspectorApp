import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
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
import 'package:inspector/style/image_picker.dart';
import 'package:inspector/style/radio.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/title.dart';

class DiggReportPage extends StatefulWidget {

  final DiggRequestCheck diggRequestCheck;
  final String status;
  final Report report;

  DiggReportPage({this.diggRequestCheck, this.report, this.status});

  @override
  DiggReportPageState createState() => DiggReportPageState();
}


class DiggReportPageState extends State<DiggReportPage> with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();

  final _commentController = TextEditingController();

  final List<Uint8List> _photos = [];
  final List<String> _photoNames = [];

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
      final photo = widget.report.photos[i];
      final image = decoder.convert(photo.data);
      _photos.add(image);
      _photoNames.add(photo.name);
    }
  }

   void _onPhotoPick(BuildContext context, File file) {
    _photos.add(file.readAsBytesSync());
    _photoNames.add(p.basename(file.path));
    BlocProvider.of<DiggReportBloc>(context).add(FlushEvent());
  }

  void _onPhotoRotate(BuildContext context, int index, Uint8List image) {
    _photos[index] = image;
    BlocProvider.of<DiggReportBloc>(context).add(FlushEvent());
  }

   void _onPhotoRemove(BuildContext context, int index) {
    _photos.removeAt(index);
    _photoNames.removeAt(index);
    BlocProvider.of<DiggReportBloc>(context).add(FlushEvent());
  }

  void _onStatus(BuildContext context, String status) {
    BlocProvider.of<DiggReportBloc>(context).add(SetStatusEvent(status));  
  }

  void _onSave(BuildContext context, int status) async {
    final report = BlocProvider.of<DiggReportBloc>(context).state.report;
    final date = report.reportDate ?? DateTime.now();
    final number = report.reportNum != null ?  '№ ${report.reportNum}' : '';
    if (_formKey.currentState.validate()) {
      if (_photos.isNotEmpty) {
        final res = await showDialog(
          context: context, 
          child: AcceptDialog(
            acceptTitle: 'Да',
            cancelTitle: 'Нет',
            message: status == ReportStatusIds.onApproval ? 'Вы подтверждаете передачу рапорта $number от ${DateFormat('dd.MM.yyyy').format(date)} на согласование?' : 'Сохранить рапорт?'
          ),
        );
        if (res != null) {
          BlocProvider.of<DiggReportBloc>(context).add(SaveReportEvent(widget.diggRequestCheck, status, _commentController.text, _photos, _photoNames));  
        }
      } else {
        _showSnackBar(context, 'Пожалуйста, добавьте минимум одну фотографию');
      }
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
    
  void _showSuccess(BuildContext context, Report report) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final title = '№${report.reportNum} от ${DateFormat('dd.MM.yyyy').format(report.reportDate)}';
        await showDialog(
          context: context, 
          child: AcceptDialog(
            cancelTitle: null,
            acceptTitle: 'ОК',
            message: report.reportStatus?.id == ReportStatusIds.onApproval ? 'Зарегистрирован рапорт $title' : 'Сохранен рапорт $title'
          )
        );
        Navigator.pop(context);
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

  String _emptyValidator(String value) {
    if (value.isEmpty) {
      return 'Введите значение';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context)=> DiggReportBloc(DiggReportBlocState(widget.status ?? (widget.report.diggRequestChecks.isNotEmpty ? widget.report.diggRequestChecks.first.status : DiggRequestCheckStatus.landscapingNotRestored), widget.report)),
      child: BlocBuilder<DiggReportBloc, DiggReportBlocState>(
        builder: (context, state) {
          if (state is SuccessState) { 
            _showSuccess(context, state.report);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildError(context, state.report),
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
                      _buildComment(state),
                      ProjectTitle('Фотоматериалы'),
                      ImagePicker(
                        margin: const EdgeInsets.only(top: 20, bottom: 0),
                        images: _photos,
                        names: _photoNames,
                        onRotated: (index, image) => _onPhotoRotate(context, index, image),
                        onPicked: (file)=> _onPhotoPick(context, file),
                        onRemoved: (index)=> _onPhotoRemove(context, index),
                      ),
                      _buildButtons(context)
                    ],
                  ),
                ),
              ),
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: _buildButtons(context)
          );
        }
      )
    );
  }

  Widget _buildError(BuildContext context, Report report) {
    if (report.error != null && report.error.isNotEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Text('Рапорт № ${report.reportNum} от ${DateFormat('dd.MM.yyyy').format(report.reportDate)} не был загружен в ЕИС ОАТИ. Ошибка: ${report.error}',
          style: ProjectTextStyles.baseBold.apply(
            color: ProjectColors.red,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ProjectColors.red,
            width: 2,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildComment(DiggReportBlocState state) {
    if (state.status != DiggRequestCheckStatus.landscapingRestored) {
      return Column(
        children: [
          ProjectTitle('Комментарий'),
          ProjectTextField(
            hintText: 'Комментарий',
            controller: _commentController,
            validator: _emptyValidator,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildButtons(BuildContext context) {
    final report = widget.report;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
