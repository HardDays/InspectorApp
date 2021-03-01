import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';
import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:provider/provider.dart';

class ExtensionPeriodForm extends StatefulWidget {
  const ExtensionPeriodForm({
    Key key,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  final void Function(
    ViolationExtensionPeriod violationExtensionPeriod,
  ) onConfirm;
  final void Function() onCancel;

  @override
  _ExtensionPeriodFormState createState() => _ExtensionPeriodFormState();
}

class _ExtensionPeriodFormState extends State<ExtensionPeriodForm> {
  ViolationExtensionReason _extensionReason =
      ViolationExtensionReason(name: '');
  TextEditingController _commentsController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  DateTime _newResolveDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Продление срока устранения нарушения',
          style: ProjectTextStyles.title,
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          controller: _commentsController,
          enabled: true,
          hintText: 'Комментарий',
          maxLines: 4,
        ),
        SizedBox(
          height: 20,
        ),
        ProjectAutocomplete<ViolationExtensionReason>(
          'Причина продления срока устранения нарушения',
          controller: _reasonController,
          enabled: true,
          formatter: (a) => a.name,
          onSuggestionSelected: (reason) => setState(() {
            _extensionReason = reason;
          }),
          suggestionsCallback: (value) async {
            final t = await Provider.of<DictionaryService>(context, listen: false)
                .getViolationExtensionReasons(name: value);
            return t;
          },
        ),
        SizedBox(
          height: 20,
        ),
        ProjectDatePicker(
          title: 'Дата последней проверки',
          hintText: 'Выберите дату или период',
          values: [_newResolveDate],
          onChanged: (value) => setState(() {
            _newResolveDate = value.first;
          }),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectButton.buildOutlineButton('Отменить',
                onPressed: widget.onCancel),
            SizedBox(width: 20),
            ProjectButton.builtFlatButton(
              'ОК',
              onPressed: () => widget.onConfirm(
                ViolationExtensionPeriod(
                  comments: _commentsController.value.text,
                  extensionReason: _extensionReason,
                  resolveDate: _newResolveDate,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
