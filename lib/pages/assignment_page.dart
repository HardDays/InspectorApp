import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/pages/address_report_page.dart';
import 'package:inspector/pages/total_report_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/assignment.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';
import 'package:inspector/widgets/assignments/status.dart';
import 'package:inspector/widgets/section.dart';
import 'package:intl/intl.dart';

class AssignmentPage extends StatelessWidget {

  // todo: сделать нормально (enum и тд, как в api)
  final String status;

  AssignmentPage(this.status);

  void _onTotalReport(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TotalReportPage(status)));
  }

  void _onAddressReport(BuildContext context, String status) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddressReportPage(status)));
  }

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
              SectionWidget('Статус поручения', child: AssignemntStatusWidget(status)),
              _buildDivider(),
              SectionWidget('Способ наблюдения', description: 'Обследование методом визуального наблюдения'),
              _buildDivider(),
              SectionWidget('Нормативно-правовой акт', description: 'Правила проведения земляных работ, установки временных ограждений, размещения временных объектов в городе Москве'),
              _buildDivider(),
              SectionWidget('Срок предоставления документов, фиксирующих факты и события нарушения', description: '11.03.2020 16:30'),
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
                        status != 'Назначено' ? Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 21, right: 10),
                                child: ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)), 
                              ),
                              SizedBox(
                                height: 38,
                                child: ProjectButton.builtFlatButton('+ Добавить рапорт', onPressed: ()=> _onTotalReport(context), style: ProjectTextStyles.baseBold),
                              ),
                            ],
                          ),
                        ) : Container(),
                        Container(
                          color: ProjectColors.darkBlue,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                          child: Text('Обследование факта окончания работ и восстановления благоустройства',
                            style: ProjectTextStyles.baseBold.apply(color: Colors.white),
                          ),
                        ),
                        _buildAddress(context, status == 'На исполнении'),
                        _buildDivider(),
                        _buildAddress(context, status == 'На исполнении' && false)
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color:  AssignemntStatusWidget.colors[status]), top: BorderSide(color:  AssignemntStatusWidget.colors[status]), bottom: BorderSide(color:  AssignemntStatusWidget.colors[status]))
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(status,
                          style: ProjectTextStyles.smallBold.apply(color: AssignemntStatusWidget.colors[status]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ProjectButton.builtFlatButton(status == 'Назначено' ? 'Принять на исполнение' : 'Подтвердить исполнение',
                  onPressed: status == 'На исполнении' ? () {} : null,
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

  Widget _buildAddress(BuildContext context, bool showRaport) {
    return ClipRect(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Slidable(
          actionExtentRatio: 0.17,
          actionPane: SlidableDrawerActionPane(),
          child: Padding(
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
                  child: Text('ЮЗАО, район Академический, Вавилова ул. 11, стр. 1 ЮЗАО еский, Вавилова ул. 11, стр. 1',
                    style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                  ),
                ),
                showRaport  ? Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      ProjectIcons.raportIcon(color: ProjectColors.blue.withOpacity(0.35)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('Рапорт № 20-61-К21 от 11.03.2020',
                          style: ProjectTextStyles.baseBold.apply(color: ProjectColors.blue, decoration: TextDecoration.underline),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ProjectColors.yellow),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                        child: Text('На согласовании',
                          style: ProjectTextStyles.smallBold.apply(color: ProjectColors.yellow),
                        ),
                      ),
                      Text(DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                        style: ProjectTextStyles.baseBold.apply(color: ProjectColors.black),
                      )
                    ],
                  ),
                ) : Container(),
              ],
            ),
          ),
          enabled: status == 'На исполнении',
          secondaryActions: [
            _buildAction(
              context,
              Icon(Icons.not_interested,
                color: ProjectColors.black,
                size: 20,
              ),
              'Работы не\nзавершены',
              'Работы не завершены'
            ),
            _buildAction(
              context,
              Icon(Icons.close,
                color: ProjectColors.red,
                size: 26,
              ),
              'Благоустройство\nне восстановлено',
              'Благоустройство не восстановлено'
            ),
            _buildAction(
              context,
              Icon(Icons.check,
                color: ProjectColors.green,
                size: 26,
              ),
              'Благоустройство\nвосстановлено',
              'Благоустройство восстановлено'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(BuildContext context, Widget icon, String text, String status) {
    return InkWell(
      onTap: ()=> _onAddressReport(context, status),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(right: BorderSide(color: ProjectColors.lightBlue))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
