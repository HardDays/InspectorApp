import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Горячая линия: ',
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
              children: [
                TextSpan(
                  text: '+7 (495) 133-27-98',
                  style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              MethodChannel('com.example.inspector/mainChannel').invokeMethod('sendEmail');
            },
            child: RichText(
              text: TextSpan(
                text: 'Email: ',
                style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
                children: [
                  TextSpan(
                    text: 'oati_support@mos.ru',
                    style: ProjectTextStyles.medium.merge(
                      TextStyle(
                        color: ProjectColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
