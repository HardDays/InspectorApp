import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/status.dart';

class ControlViolationPage extends StatelessWidget {

  // todo: сделать нормально (enum и тд, как в api)

  ControlViolationPage();

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
          child: Text('Нарушение № 20-61-A95-62 от 10.03.2020',
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
              ProjectSection('Статус нарушения', 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ProjectColors.cyan),
                    ),
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 4),
                    child: Text('На контроле',
                      style: ProjectTextStyles.smallBold.apply(color: ProjectColors.cyan),
                    ),
                  ),
                ),
              ),
              _buildDivider(),
              ProjectSection('Объект', child: ControlStatusWidget('КП', '1995126')),
              _buildDivider(),
              ProjectSection('Адрес', description: 'СВАО / Останкинский / Проспект Мира, 81'),
              _buildDivider(),
              ProjectSection('Вид объекта', description: 'Контейнер'),
              _buildDivider(),
              ProjectSection('Балансодержатель', description: 'ГБУ “Жилищник Останкинского района”'),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: _buildTitle('Реквизиты нарушения')
              ),
              ProjectSection('Номер ЦАФАП', description: '321237674657'),
              _buildDivider(),
              ProjectSection('Срок устранения', description: '11.03.2020'),
              _buildDivider(),
              ProjectSection('Адрес нарушения', description: 'СВАО / Останкинский / Проспект Мира, 81'),
              _buildDivider(),
              ProjectSection('Адресный ориентир', description: 'Около ТЦ Звездный'),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: _buildTitle('Описание нарушения')
              ),
              ProjectSection('Элемент объекта', description: 'КП'),
              _buildDivider(),
              ProjectSection('Описание нарушения', description: 'Не окрашен павильон'),
              _buildDivider(),
              ProjectSection('Дополнительный признак', description: 'Сильно бросается в глаза'),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 5),
                child: _buildTitle('Фотоматериалы')
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(5, 
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            width: 210,
                            height: 140,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: 'https://www.fillmurray.com/640/360',
                            ),
                          ),
                          Container(
                            width: 35,
                            height: 35,
                            color: ProjectColors.darkBlue,
                            child: const Icon(Icons.my_location,
                              color: Colors.white
                            ),
                          )
                        ]
                      ),
                    ),
                  )..add((5 - 2) % 3 == 0 ? SizedBox(width: 210) : Container()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 5),
                child: _buildTitle('Контроль устранения нарушения'),
              ),
            ],
          ),
        ),
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

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: ProjectColors.lightBlue,
    );
  }
}
