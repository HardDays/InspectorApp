import 'package:flutter/material.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/button.dart';

class AcceptDialog extends StatelessWidget {

  final String message;
  final String acceptTitle;
  final String cancelTitle;

  const AcceptDialog({this.message, this.acceptTitle = 'Подтвердить', this.cancelTitle = 'Отмена'});

  @override
  Widget build(BuildContext context) {
    return ProjectDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message,
            style: ProjectTextStyles.title.apply(color: ProjectColors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(cancelTitle != null)
                  ProjectButton.buildOutlineButton(cancelTitle,
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                if(cancelTitle != null)
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                ),
                ProjectButton.builtFlatButton(acceptTitle,
                  onPressed: () {
                    Navigator.pop(context, true);
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}