import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/assignment.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';
import 'package:inspector/widgets/assignments/status.dart';
import 'package:intl/intl.dart';

class AssignmentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Поручение № 20-61-A95-62 от 10.03.2020',
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
              _buildSectionItem(context, 'Статус поручения', AssignemntStatusWidget('Назначено')),
              _buildDivider(),
              _buildSectionItem(context, 'Способ наблюдения', _buildText('Обследование методом визуального наблюдения')),
              _buildDivider(),
              _buildSectionItem(context, 'Способ наблюдения', _buildText('Правила проведения земляных работ, установки временных ограждений, размещения временных объектов в городе Москве')),
              _buildDivider(),
              _buildSectionItem(context, 'Срок предоставления документов, фиксирующих факты и события нарушения', _buildText(DateFormat('dd.MM.yyy').format(DateTime.now()))),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: ProjectColors.lightBlue, 
                    width: 1,
                  ),
                ),
                margin: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AssignemntParagraphWidget(ProjectIcons.inspectorIcon(), 'К21 Комаров И.Н.', padding: const EdgeInsets.only(top: 20, left: 20, right: 20)),
                        AssignemntParagraphWidget(ProjectIcons.inspector2Icon(), 'A95 Аверин А.П.', padding: const EdgeInsets.only(top: 15, left: 20, right: 20)),
                        AssignemntParagraphWidget(ProjectIcons.mapIcon(), 'ЮЗАО, район Академический', padding: const EdgeInsets.only(top: 15, left: 20, right: 20)),
                        AssignemntParagraphWidget(ProjectIcons.pointIcon(), 'Слева от магазина Пятерочка', padding: const EdgeInsets.only(top: 15, left: 20, right: 20)),
                        AssignemntParagraphWidget(ProjectIcons.themeIcon(), 'Благоустройство и санитарное содержание территории, внешний вид объектов, состояние аварийных раскопок и строительных объектов; объекты, выявленные видеонаблюдением', padding: const EdgeInsets.only(top: 15, left: 20, right: 20)),
                        Container(
                          color: ProjectColors.darkBlue,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                          child: Text('Обследование факта окончания работ и восстановления благоустройства',
                            style: ProjectTextStyles.baseBold.apply(color: Colors.white),
                          ),
                        ),
                        _buildAddress(),
                        _buildDivider(),
                        _buildAddress()
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          border: const Border(left: const BorderSide(color: ProjectColors.cyan), top: const BorderSide(color: ProjectColors.cyan), bottom: const BorderSide(color: ProjectColors.cyan))
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
                        margin: const EdgeInsets.only(top: 20),
                        child: Text('Назначено',
                          style: ProjectTextStyles.smallBold.apply(color: ProjectColors.cyan),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProjectButton.builtFlatButton('Принять на исполнение',
                  onPressed: () {}
                ),
              ),
            ],
          ),
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

  Widget _buildAddress() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('У09392399123',
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('ЮЗАО, район Академический, Вавилова ул. 11, стр. 1 ЮЗАО',
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(text,  
      style: ProjectTextStyles.base.apply(color: ProjectColors.black),
    );
  }

  Widget _buildSectionItem(BuildContext context, String name, Widget child) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          margin: const EdgeInsets.all(16.0),
          child: Text(name,
            style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            child: child,
          )
        ),
      ],
    );
  }
}
