import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

abstract class ProjectButton {
  static Widget builtFlatButton(
    String data, {
    bool disabled = false,
    VoidCallback onPressed,
    TextStyle style,
    Color textColor = ProjectColors.white,
    Color color = ProjectColors.blue,
    Color disabledColor = ProjectColors.lightBlue,
    Color disabledTextColor = ProjectColors.grey,
  }) {
    return FlatButton(
      onPressed: !disabled ? onPressed : null,
      textColor: textColor,
      color: color,
      splashColor: Color(0x00000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 20.0),
      child: Text(
        data,
        style: style ?? ProjectTextStyles.title,
      ),
    );
  }

  static Widget buildOutlineButton(
    String data, {
    Widget icon,
    TextStyle style,
    Color color = ProjectColors.blue,
    Color disabledColor = ProjectColors.lightBlue,
    VoidCallback onPressed,
  }) {
    return OutlineButton(
      onPressed: onPressed,
      borderSide: BorderSide(color: color, width: 2.0),
      splashColor: Color(0x000000),
      textColor: color,
      disabledTextColor: disabledColor,
      disabledBorderColor: disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.5, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: icon != null ? 10 : 0),
            child: icon,
          ),
          Text(
            data,
            style: style ?? ProjectTextStyles.title,
          ),
        ],
      ),
    );
  }
}
