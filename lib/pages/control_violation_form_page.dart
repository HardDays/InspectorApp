import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:inspector/widgets/control/violation_form/violation_form.dart';
import 'package:provider/provider.dart';

class ControlViolationFormPage extends StatelessWidget {
  const ControlViolationFormPage({
    Key key,
    @required this.controlObject, 
    @required this.onConfirm,
    this.violation,
    @required this.violationNum,
  }) : super(key: key);

  final ControlObject controlObject;
  final void Function(DCViolation violation) onConfirm;
  final DCViolation violation;
  final String violationNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProjectAppbar(violationNum),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
          child: Column(
            children: [
              ControlObjectInfo(
                controlObject: controlObject,
              ),
              ViolationFormWidget(
                dictionaryService: Provider.of<DictionaryService>(context, listen: false),
                onConfirm: (DCViolation violation) {
                  onConfirm(violation);
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
                initialViolation: violation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
