import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:intl/intl.dart';

class ControlViolationPage extends StatelessWidget {
  const ControlViolationPage({
    this.controlObject,
    this.searchResult,
    Key key,
  }) : super(key: key);

  final ControlObject controlObject;
  final ControlResultSearchResult searchResult;

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
            'Нарушение ${searchResult.violation.violationNum ?? ""} от ${DateFormat("dd.MM.yyyy").format(searchResult.surveyDate)}',
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
              ProjectSection(
                'Статус нарушения',
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ProjectColors.cyan),
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 2, bottom: 4),
                    child: Text(
                      searchResult.violation.violationStatus.name,
                      style: ProjectTextStyles.smallBold
                          .apply(color: ProjectColors.cyan),
                    ),
                  ),
                ),
              ),
              ControlObjectInfo(
                controlObject: controlObject,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: _buildTitle('Реквизиты нарушения'),
              ),
              ProjectSection(
                'Номер ЦАФАП',
                description:
                    searchResult.violation.cafapPrescriptionNum?.toString(),
              ),
              _buildDivider(),
              ProjectSection(
                'Срок устранения',
                description: searchResult.violation.resolveDate != null
                    ? DateFormat("dd.MM.yyyy")
                        .format(searchResult.violation.resolveDate)
                    : '',
              ),
              _buildDivider(),
              ProjectSection(
                'Адрес нарушения',
                description: searchResult.violation.btiAddress?.toLongString(),
              ),
              _buildDivider(),
              ProjectSection(
                'Адресный ориентир',
                description: searchResult.violation.address,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 10),
                child: _buildTitle('Описание нарушения'),
              ),
              ProjectSection(
                'Элемент объекта',
                description:
                    searchResult.violation.objectElement.objectType?.name,
              ),
              _buildDivider(),
              ProjectSection(
                'Описание нарушения',
                description: searchResult.violation.description,
              ),
              _buildDivider(),
              ProjectSection(
                'Дополнительный признак',
                description: searchResult.violation.additionalFeatures.isEmpty
                    ? ''
                    : searchResult.violation.additionalFeatures.first.name,
              ),
              _buildDivider(),
              if (searchResult.violation.photos != null &&
                  searchResult.violation.photos.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 5),
                  child: _buildTitle('Фотоматериалы'),
                ),
              if (searchResult.violation.photos != null &&
                  searchResult.violation.photos.isNotEmpty)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: searchResult.violation.photos
                        .map(
                          (photo) => Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  width: 210,
                                  height: 140,
                                  child: Image(
                                    image:
                                        MemoryImage(base64.decode(photo.data)),
                                  ),
                                ),
                                if (photo.geometryX != null &&
                                    photo.geometryY != null)
                                  Container(
                                    width: 35,
                                    height: 35,
                                    color: ProjectColors.darkBlue,
                                    child: const Icon(
                                      Icons.my_location,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                        .cast<Widget>()
                        .toList()
                          ..add((5 - 2) % 3 == 0
                              ? SizedBox(width: 210)
                              : Container()),
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
        Text(
          title,
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
