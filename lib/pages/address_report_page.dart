import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Рапорт',
            style: ProjectTextStyles.title.apply(
              color: ProjectColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            children: [
              _buildTitle('Обследование факта окончания работ и восстановления благоустройства'),
              ProjectSection('Номер разрытия', description: 'У093923453455'),
              _buildDivider(),
              ProjectSection('Адрес', description: 'ЮЗАО, район Академический, Вавилова ул. 11, стр. 2'),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: _buildTitle('Статус'),
              ),
              _buildRadio('Работы не завершены'),
              _buildRadio('Благоустройство не восстановлено'),
              _buildRadio('Благоустройство восстановлено'),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 20),
                child: _buildTitle('Комментарий'),
              ),
              Container(
                child: TextFormField(
                  style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                  maxLines: 5,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Комментарий',
                    contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                    hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: ProjectColors.lightBlue, width: 1)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: _buildTitle('Фотоматериалы'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 70),
                child: ImagePicker()
              ),
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

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: ProjectColors.lightBlue,
    );
  }

  Widget _buildRadio(String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            margin: const EdgeInsets.only(right: 10),
            child: Radio(
              value: value,
              groupValue: status,
              onChanged: _onStatus,
            ),
          ),
          Text(value,
            style: status == value ? ProjectTextStyles.baseBold.apply(color: ProjectColors.black,) : ProjectTextStyles.base.apply(color: ProjectColors.black,),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: ProjectTextStyles.subTitle.apply(color: ProjectColors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: _buildDivider(),
        ),
      ],
    );
  }
}
