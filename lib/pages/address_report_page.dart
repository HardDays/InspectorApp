import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/divider.dart';
import 'package:inspector/style/radio.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:inspector/widgets/image_picker.dart';
import 'package:inspector/style/section.dart';

class AddressReportPage extends StatefulWidget {

  //todo: make according api model
  final String status;

  AddressReportPage(this.status);

  @override
  AddressReportPageState createState() => AddressReportPageState();
}


class AddressReportPageState extends State<AddressReportPage> with SingleTickerProviderStateMixin {

  String status;

  void initState() {
    super.initState();

    status = widget.status;
  }

  void _onStatus(String value) {
    setState(() {
      status = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProjectAppbar('Рапорт'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            children: [
              ProjectTitle('Обследование факта окончания работ и восстановления благоустройства'),
              ProjectSection('Номер разрытия', description: 'У093923453455'),
              ProjectSection('Адрес', description: 'ЮЗАО, район Академический, Вавилова ул. 11, стр. 2'),
              ProjectTitle('Статус'),
              ProjectRadio('Работы не завершены',
                value: status,
                groupValue: 'Работы не завершены',
              ),
              ProjectRadio('Благоустройство не восстановлено',
                value: status,
                groupValue: 'Благоустройство не восстановлено',
              ),
              ProjectRadio('Благоустройство восстановлено',
                value: status,
                groupValue: 'Благоустройство восстановлено',
              ),
              ProjectTitle('Комментарий'),
              ProjectTextField(
                hintText: 'Комментарий',
              ),
              ProjectTitle('Фотоматериалы'),
              ImagePicker(
                margin: const EdgeInsets.only(top: 20, bottom: 70),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProjectButton.builtFlatButton('Сохранить проект',
              onPressed: () {}
            ),
            ProjectButton.builtFlatButton('Сохранить',
              onPressed: () {}
            ),
            ProjectButton.builtFlatButton('На согласование',
              onPressed: () {}
            ),
            ProjectButton.builtFlatButton('Удалить', 
              color: ProjectColors.red,
              onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}
