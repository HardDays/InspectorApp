import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/image_picker.dart';
import 'package:intl/intl.dart';

class PerformControlFormWidget extends StatefulWidget {
  const PerformControlFormWidget({
    Key key,
    this.performControl,
    this.violationNum, this.onConfirm, this.onCancel,

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
        Text('Нарушение ${widget.violationNum ?? ""} ${widget.performControl
            .resolved ? "Устранено" : "Не устранено"} ${DateFormat(
            "dd.MM.yyyy hh:mm").format(widget.performControl.factDate)}'),
        ImagePicker(
          images: performControl.photos.map((e) => base64.decode(e.data))
              .toList(),
          names: performControl.photos.map((e) => e.name ?? '').toList(),
          onPicked: (f) => setState(() {
            final newList = List.of(performControl.photos);
            newList.add(DCPhoto(data: base64.encode(f.readAsBytesSync())));
            performControl = performControl.copyWith(photos: newList);
          }),
          onRemoved: (i) => setState(() {
            final newList = List.of(performControl.photos);
            newList.removeAt(i);
            performControl = performControl.copyWith(photos: newList);
          }),
          onRotated: (i, f) => setState(() {
            final newList = List.of(performControl.photos);
            final photo = performControl.photos[i];
            newList.removeAt(i);
            newList.insert(i, photo.copyWith(data: base64.encode(f)));
            performControl = performControl.copyWith(photos: newList);
          }),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectButton.buildOutlineButton('Отменить', onPressed: widget.onCancel),
            SizedBox(width: 20),
            ProjectButton.builtFlatButton('ОК', onPressed: () => widget.onConfirm(performControl)),
          ],
        ),
      ],
    );
  }
}
