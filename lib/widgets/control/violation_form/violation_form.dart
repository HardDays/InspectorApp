import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';

class ViolationFormWidget extends StatefulWidget {
  ViolationFormWidget({
    Key key,
    this.onConfirm,
  }) : super(key: key);

  final Function() onConfirm;

  @override
  _ViolationFormWidgetState createState() => _ViolationFormWidgetState();
}

class _ViolationFormWidgetState extends State<ViolationFormWidget> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _targetMarkController = TextEditingController();
  TextEditingController _objectElementController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _additionalFeatureController = TextEditingController();
  TextEditingController _contractorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              'Определить адрес по местоположению',
              style: ProjectTextStyles.base.apply(
                color: ProjectColors.black,
              ),
            ),
            Spacer(),
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              'Критичность',
              style: ProjectTextStyles.base.apply(
                color: ProjectColors.black,
              ),
            ),
          ],
        ),
        ProjectTextField(
          title: 'Адрес',
          controller: _addressController,
          hintText: 'Выберите значение',
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          title: 'Адресный ориентир',
          controller: _targetMarkController,
          hintText: 'Введите данные',
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          title: 'Элемент объекта',
          controller: _objectElementController,
          hintText: 'Выберите значение',
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          title: 'Описание нарушения',
          controller: _descriptionController,
          hintText: 'Введите данные',
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          title: 'Дополнительный признак',
          controller: _additionalFeatureController,
          hintText: 'Введите данные',
        ),
        SizedBox(
          height: 20,
        ),
        ProjectTextField(
          title: 'Подрядчик',
          controller: _contractorController,
          hintText: 'Выберите значение',
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _targetMarkController.dispose();
    _objectElementController.dispose();
    _descriptionController.dispose();
    _additionalFeatureController.dispose();
    _contractorController.dispose();
  }
}
