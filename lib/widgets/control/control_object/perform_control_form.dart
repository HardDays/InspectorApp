import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/image_picker.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class PerformControlFormWidget extends StatefulWidget {
  const PerformControlFormWidget({
    Key key,
    this.performControl,
    this.violationNum,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  final PerformControl performControl;
  final String violationNum;
  final void Function(PerformControl) onConfirm;
  final void Function() onCancel;

  @override
  _PerformControlFormWidgetState createState() =>
      _PerformControlFormWidgetState();
}

class _PerformControlFormWidgetState extends State<PerformControlFormWidget> {
  PerformControl performControl;

  @override
  void initState() {
    super.initState();
    performControl = widget.performControl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Нарушение ${widget.violationNum ?? ""}',
          style: ProjectTextStyles.title,
        ),
        Text(
          '${widget.performControl.resolved ? "Устранено" : "Не устранено"}',
          style: ProjectTextStyles.title.apply(
            color: widget.performControl.resolved
                ? ProjectColors.green
                : ProjectColors.red,
          ),
        ),
        Text(
          '${DateFormat("dd.MM.yyyy hh:mm").format(widget.performControl.factDate)}',
          style: ProjectTextStyles.title,
        ),
        ImagePicker(
          images:
              performControl.photos.map((e) => base64.decode(e.data)).toList(),
          names: performControl.photos.map((e) => e.name ?? '').toList(),
          onPicked: (f) => setState(
            () => performControl.photos.add(
              DCPhoto(
                data: base64.encode(f.readAsBytesSync()),
                name: f.path,
              ),
            ),
          ),
          onRemoved: (i) => setState(() => performControl.photos.removeAt(i)),
          onRotated: (i, f) => setState(() => performControl.photos[i] =
              performControl.photos[i].copyWith(data: base64.encode(f))),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectButton.buildOutlineButton(
              'Отменить',
              onPressed: () {
                widget.onCancel();
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: 20),
            ProjectButton.builtFlatButton(
              'ОК',
              onPressed: () {
                widget.onConfirm(performControl);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
