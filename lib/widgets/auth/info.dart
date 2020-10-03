import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 38.0),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: 'Горячая линия: ',
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
              children: [
                TextSpan(
                  text: '+7 495 663-10-00',
                  style: ProjectTextStyles.medium.merge(
                    TextStyle(
                      color: ProjectColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Email: ',
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
              children: [
                TextSpan(
                  text: 'oati_support@mos.ru',
                  style: ProjectTextStyles.medium.merge(
                    TextStyle(
                      color: ProjectColors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
