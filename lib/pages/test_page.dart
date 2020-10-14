import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/employee.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/resolution_type.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';

class TestPage extends StatelessWidget {
  TestPage({Key key}) : super(key: key);

  final DictionaryService dictionaryService = DictionaryService();

  static const _colorsMap = {
    '1. Blue': ProjectColors.blue,
    '2. Dark_blue': ProjectColors.darkBlue,
    '3. Medium_blue': ProjectColors.mediumBlue,
    '4. Light_blue': ProjectColors.lightBlue,
    '5. White': ProjectColors.white,
    '6. Black': ProjectColors.black,
    '7. Grey': ProjectColors.grey,
    '8. Red': ProjectColors.red,
    '9. Green': ProjectColors.green,
    '10. Yellow': ProjectColors.yellow,
    '11. Cyan': ProjectColors.cyan,
  };

  Widget _buildColorItem(Color color, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              color: color,
              width: 50.0,
              height: 50.0,
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: ProjectTextStyles.title,
          ),
        ],
      ),
    );
  }

  Widget _buildDelimiter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 3.0,
        color: ProjectColors.mediumBlue,
      ),
    );
  }

  List<Widget> _buildFonts() {
    return [
      _buildFontInfo(
        ProjectTextStyles.title,
        'Title',
        'Montserrat Semibold',
        '18/24',
      ),
      _buildFontInfo(
        ProjectTextStyles.subTitle,
        'Subtitle',
        'Montserrat Semibold',
        '16/22',
      ),
      _buildFontInfo(
        ProjectTextStyles.base,
        'Base',
        'Montserrat Regular',
        '14/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.baseBold,
        'Base bold',
        'Montserrat Semibold',
        '14/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.medium,
        'Medium',
        'Montserrat Regular',
        '13/18',
      ),
      _buildFontInfo(
        ProjectTextStyles.mediumBold,
        'Medium bold',
        'Montserrat Semibold',
        '12/16',
      ),
      _buildFontInfo(
        ProjectTextStyles.small,
        'Small',
        'Montserrat Regular',
        '12/16',
      ),
      _buildFontInfo(
        ProjectTextStyles.smallBold,
        'Small bold',
        'Montserrat Semibold',
        '12/16',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Text(
          'Тестовая страница',
          style: ProjectTextStyles.title.apply(
            color: ProjectColors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Цвета',
              style: ProjectTextStyles.title,
            ),
            ..._colorsMap.entries.map((e) => _buildColorItem(e.value, e.key)),
            _buildDelimiter(),
            Text(
              'Шрифты',
              style: ProjectTextStyles.title,
            ),
            ..._buildFonts(),
            _buildDelimiter(),
            Text(
              'Иконки',
              style: ProjectTextStyles.title,
            ),
            _buildAppBarWithIcons(),
            GridView.count(
              crossAxisCount: 10,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                ProjectIcons.calendarIcon(),
                ProjectIcons.themeIcon(),
                ProjectIcons.mapIcon(),
                ProjectIcons.viewIcon(),
                ProjectIcons.deleteIcon(),
                ProjectIcons.inspectorIcon(),
                ProjectIcons.inspector2Icon(),
                ProjectIcons.pointIcon(),
                ProjectIcons.exitIcon(),
                ProjectIcons.raportIcon(),
                ProjectIcons.addIcon(),
                ProjectIcons.refreshIcon(),
                ProjectIcons.mailIcon(),
                ProjectIcons.copyIcon(),
                ProjectIcons.microphoneIcon(),
                ProjectIcons.editIcon(),
                ProjectIcons.cameraIcon(),
                ProjectIcons.alertIcon(),
                ProjectIcons.mapCloseIcon(),
              ]
                  .map(
                    (e) => Center(
                      child: e,
                    ),
                  )
                  .toList(),
            ),
            BottomNavigationBar(
              selectedItemColor: ProjectColors.blue,
              selectedLabelStyle:
                  ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
              unselectedItemColor: ProjectColors.mediumBlue,
              unselectedLabelStyle:
                  ProjectTextStyles.base.apply(color: ProjectColors.mediumBlue),
              currentIndex: 0,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: ProjectIcons.listIcon(),
                  title: Text('Поручения'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.vkIcon(),
                  title: Text('Ведомственный контроль'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.map2Icon(),
                  title: Text('Карта'),
                ),
                BottomNavigationBarItem(
                  icon: ProjectIcons.profileIcon(),
                  title: Text('Профиль'),
                ),
              ],
            ),
            _buildDelimiter(),
            Text(
              'Кнопки',
              style: ProjectTextStyles.title,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProjectButton.buildOutlineButton(
                    'Data',
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  ProjectButton.builtFlatButton(
                    'Data',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProjectButton.buildOutlineButton(
                    'Data',
                  ),
                  SizedBox(width: 10.0),
                  ProjectButton.builtFlatButton(
                    'Data',
                  ),
                ],
              ),
            ),
            DictionaryWidget<CheckStatus>(
              dictionaryName: 'Check Statuses',
              loader: dictionaryService.getCheckStatuses,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<Address>(
              dictionaryName: 'Addresses',
              loader: dictionaryService.getAddresses,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<CheckType>(
              dictionaryName: 'Check Types',
              loader: dictionaryService.getCheckTypes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<NormativeAct>(
              dictionaryName: 'Normative Acts',
              loader: dictionaryService.getNormativeActs,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolationKind>(
              dictionaryName: 'Violation Kinds',
              loader: dictionaryService.getViolationKinds,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolationType>(
              dictionaryName: 'Violation Types',
              loader: dictionaryService.getViolationTypes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<Employee>(
              dictionaryName: 'Employees',
              loader: dictionaryService.getEmployees,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ReportStatus>(
              dictionaryName: 'Report Statuses',
              loader: dictionaryService.getReportStatuses,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorType>(
              dictionaryName: 'Violator Types',
              loader: dictionaryService.getViolatorTypes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<InstructionStatus>(
              dictionaryName: 'Instruction Statuses',
              loader: dictionaryService.getInstructionStatuses,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<OatiDepartment>(
              dictionaryName: 'Oati Departments',
              loader: dictionaryService.getOatiDepartments,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<SpecialObject>(
              dictionaryName: 'Special Objects',
              loader: dictionaryService.getSpecialObjects,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ObjectCategory>(
              dictionaryName: 'Object Categories',
              loader: dictionaryService.getObjectCategories,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<DepartmentCode>(
              dictionaryName: 'Department Codes',
              loader: dictionaryService.getDepartmentCodes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorDocumentType>(
              dictionaryName: 'Violator Document Types',
              loader: dictionaryService.getViolatorDocumentTypes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorInfoLegal>(
              dictionaryName: 'Violator Info Legal',
              loader: dictionaryService.getViolatorInfoLegal,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorInfoOfficial>(
              dictionaryName: 'Violator Info Official',
              loader: dictionaryService.getViolatorInfoOfficial,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorInfoPrivate>(
              dictionaryName: 'Violator Info Private',
              loader: dictionaryService.getViolatorInfoPrivate,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ViolatorInfoIp>(
              dictionaryName: 'Violator Info Ip',
              loader: dictionaryService.getViolatorInfoIp,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<ResolutionType>(
              dictionaryName: 'Resolution Type',
              loader: dictionaryService.getResolutionTypes,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
            DictionaryWidget<NormativeActArticle>(
              dictionaryName: 'Normative Act Article',
              loader: dictionaryService.getNormativeActArticles,
              mapping: (item) => item
                  .toJson()
                  .map((key, value) => MapEntry(key, value.toString())),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBarWithIcons() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ProjectColors.darkBlue,
      title: Row(
        children: [
          _buildAppBarIcon('Sort'),
          _buildAppBarIcon('Filter'),
          _buildAppBarIcon('Back'),
        ],
      ),
    );
  }

  IconButton _buildAppBarIcon(String name) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'icons/Top_menu_icon/$name.svg',
        color: ProjectColors.white,
      ),
    );
  }

  Padding _buildFontInfo(
      TextStyle style, String name, String fontName, String size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: style.apply(color: ProjectColors.blue),
            ),
            Text(
              fontName,
              style: style.apply(color: ProjectColors.black),
            ),
            Text(
              size,
              style: style.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }
}

typedef Map<String, String> FieldMapper<T>(T item);

class DictionaryWidget<T> extends StatelessWidget {
  final String dictionaryName;
  final FieldMapper<T> mapping;
  final DictionaryLoader<T> loader;

  const DictionaryWidget(
      {Key key, this.dictionaryName, this.mapping, this.loader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(dictionaryName, style: ProjectTextStyles.title),
          DictionaryShowWidget(
            loader: loader,
            widgetBuilder: (item) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: ProjectColors.mediumBlue,
                  ),
                ),
                ...mapping(item)
                    .map((key, value) => MapEntry(
                          key,
                          Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(key,
                                      style: ProjectTextStyles.subTitle),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    value,
                                    style: ProjectTextStyles.base,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .values
                    .cast<Widget>()
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

typedef Widget WidgetBuilder<S>(S item);
typedef Future<List<T>> DictionaryLoader<T>();

class DictionaryShowWidget<T> extends StatefulWidget {
  final WidgetBuilder<T> widgetBuilder;
  final DictionaryLoader<T> loader;

  const DictionaryShowWidget({Key key, this.widgetBuilder, this.loader})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DictionaryShowWidgetState<T>();
  }
}

enum LoadingState { initial, loading, loaded }

class DictionaryShowWidgetState<T> extends State<DictionaryShowWidget<T>> {
  List<T> data;
  LoadingState state = LoadingState.initial;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case LoadingState.initial:
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: RaisedButton(
            onPressed: () async {
              setState(() {
                state = LoadingState.loading;
              });
              data = await widget.loader();
              setState(() {
                state = LoadingState.loaded;
              });
            },
            child: Text('Start Loading'),
          ),
        );
        break;
      case LoadingState.loading:
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: CircularProgressIndicator(),
        );
        break;
      case LoadingState.loaded:
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: data.map((e) => widget.widgetBuilder(e)).toList(),
          ),
        );
        break;
    }
  }
}
