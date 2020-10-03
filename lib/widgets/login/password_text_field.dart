import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordTextField({Key key, this.onChanged}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: _controller,
          style: TextStyle(
            color: ProjectColors.darkBlue,
          ).merge(ProjectTextStyles.base),
          decoration: InputDecoration(
            hintText: 'Пароль',
            hintStyle: TextStyle(
              color: ProjectColors.mediumBlue,
            ).merge(ProjectTextStyles.base),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: ProjectColors.mediumBlue),
            ),
          ),
          obscureText: !showPassword,
          onChanged: widget.onChanged,
        ),
        Positioned(
          right: -10.0,
          child: IconButton(
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
            icon: ProjectIcons.viewIcon(color: ProjectColors.darkBlue),
          ),
        ),
      ],
    );
  }
}
