import 'package:flutter/material.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/button.dart';

class AcceptDialog extends StatelessWidget {

  final String message;

  const AcceptDialog({this.message});

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
                ProjectButton.buildOutlineButton('Отмена',
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                ),
                ProjectButton.builtFlatButton('Подтвердить',
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