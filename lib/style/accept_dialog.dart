import 'package:flutter/material.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/button.dart';

class AcceptDialog extends StatefulWidget {

  final String message;
  final String acceptTitle;
  final String cancelTitle;
  final String responseHint;

  const AcceptDialog({this.message, this.acceptTitle = 'Подтвердить', this.cancelTitle = 'Отмена', this.responseHint});

  @override
  _AcceptDialogState createState() => _AcceptDialogState();
}

class _AcceptDialogState extends State<AcceptDialog> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProjectDialog(
      child: Container(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.message,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.title.apply(color: ProjectColors.black),
            ),
            if(widget.responseHint != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: widget.responseHint,
                    hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(widget.cancelTitle != null)
                    ProjectButton.buildOutlineButton(widget.cancelTitle,
                      onPressed: () {
                        Navigator.pop(context);
                      }
                    ),
                  if(widget.cancelTitle != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                  ),
                  ProjectButton.builtFlatButton(widget.acceptTitle,
                    onPressed: () {
                      Navigator.pop(context, widget.responseHint == null ? true : controller.value.text);
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}