import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/blocs/total_report/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/address_search.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/checkbox.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:inspector/widgets/dictionary_dialog.dart';
import 'package:inspector/widgets/image_picker.dart';
import 'package:latlong/latlong.dart';

class TotalReportPage extends StatefulWidget {

  // final bool violationNotPresent;
  // final int instructionId;
  // final int checkId;

  final Report report;

  TotalReportPage({this.report});

  @override
  TotalReportPageState createState() => TotalReportPageState();
}

class TotalReportPageState extends State<TotalReportPage> with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();

  final _mapController = MapController();

  final _searchController = TextEditingController();
  final _areaController = TextEditingController();
  final _streetController = TextEditingController();
  final _districtController = TextEditingController();
  final _addressController = TextEditingController();
  final _specifiedAddressController = TextEditingController();
  final _violationDescriptionController = TextEditingController();
  final _codexArticleController = TextEditingController();
  final _objectCategoryController = TextEditingController();
  final _violationTypeController = TextEditingController();
  
  final _normativeActControllers = [
    TextEditingController()
  ];
  final _normativeActArticleControllers = [
    TextEditingController()
  ];
  final List<Uint8List> _photos = [

  ];

  final _violatorFormKeys = [
    GlobalKey<FormState>()
  ];
  final _violatorTypeControllers = [
    TextEditingController()
  ];
  final _violatorControllers = [
    TextEditingController()
  ];
  final _firstNameControllers = [
    TextEditingController()
  ];
  final _lastNameControllers = [
    TextEditingController()
  ];
  final _patronymControllers = [
    TextEditingController()
  ];
  final _docTypeControllers = [
    TextEditingController()
  ];
  final _docSeriesControllers = [
    TextEditingController()
  ];
  final _docNumberControllers = [
    TextEditingController()
  ];
  final _innControllers = [
    TextEditingController()
  ];
  final _snilsControllers = [
    TextEditingController()
  ];
  final _ogrnControllers = [
    TextEditingController()
  ];
  final _kppControllers = [
    TextEditingController()
  ];
  final _phoneControllers = [
    TextEditingController()
  ];
  final _legalAddressControllers = [
    TextEditingController()
  ];
  final _postalAddressControllers = [
    TextEditingController()
  ];
  final _registrationAddressControllers = [
    TextEditingController()
  ];
  final _birthPlaceControllers = [
    TextEditingController()
  ];
  final _departmentCodeControllers = [
    TextEditingController()
  ];
  final List<DateTime> _registerDates = [
    null
  ];
  final List<DateTime> _birthDates = [
    null
  ];

  List<List<TextEditingController>> _allViolatorControllers = [];

  bool get editable {
    final report = widget.report;  
    return report.reportStatus == null ||
      report.reportStatus?.id == ReportStatusIds.new_ || 
      report.reportStatus?.id == ReportStatusIds.project || 
      report.reportStatus?.id == ReportStatusIds.declined; 
  }

  void initState() {
    super.initState();

    _allViolatorControllers = [
      _violatorControllers, _phoneControllers, 
      _firstNameControllers, _lastNameControllers, _patronymControllers,
      _docTypeControllers, _docSeriesControllers, _docNumberControllers,
      _innControllers, _snilsControllers, _ogrnControllers, _kppControllers, 
      _legalAddressControllers, _postalAddressControllers, _registrationAddressControllers,
      _birthPlaceControllers, _departmentCodeControllers
    ];

    if (widget.report.violationNotPresent) {
      final decoder = Base64Decoder();
      for (int i = 0; i < widget.report.photos.length; i++) {
        final image = decoder.convert(widget.report.photos[i].data);
        _photos.add(image);
      }
    } else {
      final violation = widget.report.violation;
      if (violation != null) {
        _areaController.text = violation.violationAddress?.area?.toString() ?? '';
        _districtController.text = violation.violationAddress?.district?.toString() ?? '';
        _streetController.text = violation.violationAddress?.street?.toString() ?? '';
        _addressController.text = violation.violationAddress?.toString() ?? '';
        _specifiedAddressController.text = violation.violationAddress?.specifiedAddress ?? '';
        _violationDescriptionController.text = violation.violationDescription ?? '';
        _codexArticleController.text = violation.codexArticle ?? '';
        _objectCategoryController.text = violation.objectCategory?.toString() ?? '';
        _violationTypeController.text = violation.violationType?.toString() ?? '';
        
        final decoder = Base64Decoder();
        for (int i = 0; i < violation.photos.length; i++) {
          final image = decoder.convert(violation.photos[i].data);
          _photos.add(image);
        }
        for (int i = 0; i < violation.normativeActArticles.length - 1; i++) {
          _addNormativeActControllers();
        }
        for (int i = 0; i < violation.normativeActArticles.length; i++) {
          _normativeActControllers[i].text = violation.normativeActArticles[i].normativeAct;
          _normativeActArticleControllers[i].text = violation.normativeActArticles[i].toString();
        }

        for (int i = 0; i < violation.violators.length - 1; i++) {
          _addViolatorControllers();
        }
        for (int i = 0; i < violation.violators.length; i++) {
          final violator = violation.violators[i].violatorPerson;
          if (violator != null) {
            _violatorTypeControllers[i].text = violation.violators[i].type.toString();
            _addViolatorInfo(i, violator);
          }
        } 
      }
    }
  }

  void _onViolationNotPresent(BuildContext context, bool value) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationNotPresentEvent(value));  
  }

  void _onViolatorNotFound(BuildContext context, bool value, int index) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorNotFoundEvent(index, value));  
  }

  void _onViolatorForeign(BuildContext context, bool value, int index) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorForeignEvent(index, value));  
  }

  void _onBirthDateSelect(BuildContext context, int index, List<DateTime> value) {
    _birthDates[index] = value?.first;
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

   void _onRegisterDateSelect(BuildContext context, int index, List<DateTime> value) {
    _registerDates[index] = value?.first;
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onMapSearchSelect(BuildContext context, AddressSearch value) async {
    _searchController.text = value?.toString() ?? '';
    if (value != null) {
      final address = await BlocProvider.of<TotalReportBloc>(context).getGeocoding(value.toString());
      if (address != null && address.lat != null && address.lng != null) {
        _mapController.move(LatLng(address.lat, address.lng), 16.5);
      }
    }
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onAreaSelect(BuildContext context, Area value) {
    _areaController.text = value?.toString() ?? '';
    _districtController.clear();
    _streetController.clear();
    _addressController.clear();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationAreaEvent(value));  
  }

  void _onDistrictSelect(BuildContext context, District value) {
    _districtController.text = value?.toString() ?? '';
    _streetController.clear();
    _addressController.clear();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationDistrictEvent(value));  
  }

  void _onStreetSelect(BuildContext context, Street value) {
    _streetController.text = value?.toString() ?? '';
    _addressController.clear();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationStreetEvent(value));  
  }

  void _onAddressSelect(BuildContext context, Address value) {
    _addressController.text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationAddressEvent(value));  
  }

  void _onObjectCategorySelect(BuildContext context, ObjectCategory value) {
    _objectCategoryController.text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationOjbectCategoryEvent(value));  
  }

  void _onNormativeActSelect(BuildContext context, int index, NormativeAct value) {
    _normativeActControllers[index].text = value?.toString() ?? '';
    _normativeActArticleControllers[index].clear();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationNormativeActEvent(index, value));  
  }

  void _onNormativeActArticleSelect(BuildContext context, int index, NormativeActArticle value) {
    _normativeActArticleControllers[index].text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationNormativeActArticleEvent(index, value));  
  }

  void _onPhotoPick(BuildContext context, File file) {
    _photos.add(file.readAsBytesSync());
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onPhotoRemove(BuildContext context, int index) {
    _photos.removeAt(index);
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

   void _onViolationTypeSelect(BuildContext context, ViolationType value) {
    _violationTypeController.text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationTypeEvent(value));  
  }

  void _onViolatorTypeSelect(BuildContext context, int index, ViolatorType value) {
    _violatorTypeControllers[index].text = value?.toString() ?? '';
    _clearViolatorControllers(index);
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorTypeEvent(index, value));  
  }

  void _onDepartmentCodeSelect(BuildContext context, int index, DepartmentCode value) {
    _departmentCodeControllers[index].text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorDepartmentCodeEvent(index, value));  
  }

  void _onViolatorDocumentTypeSelect(BuildContext context, int index, ViolatorDocumentType value) {
    _docTypeControllers[index].text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorDocumentTypeEvent(index, value));  
  }

  void _onAddNormativeAct(BuildContext context) {
    if (editable) {
      _addNormativeActControllers();
      BlocProvider.of<TotalReportBloc>(context).add(AddViolationActEvent());  
    }
  }

  void _onAddViolator(BuildContext context) {
    if (editable) {
      _addViolatorControllers();
      BlocProvider.of<TotalReportBloc>(context).add(AddViolatorEvent());  
    }
  }

  void _onViolatorSelect(BuildContext context, int index, dynamic violator) {
    _addViolatorInfo(index, violator);
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorInfoEvent(index, violator));
  }

  Future<Iterable<AddressSearch>> _onMapSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getSearchAddresses(name);
  }

  Future<Iterable<Area>> _onAreaSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getAreas(name);
  }

  Future<Iterable<District>> _onDistrictSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getDistricts(name);
  }

  Future<Iterable<Street>> _onStreetSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getStreets(name);
  }

  Future<Iterable<Address>> _onAddressSearch(BuildContext context, String houseNum) async {
    return await BlocProvider.of<TotalReportBloc>(context).getAddresses(houseNum);
  }

  Future<Iterable<ObjectCategory>> _onObjectCategoriesSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getObjectCategories(name);
  }

  Future<Iterable<NormativeAct>> _onNormativeActSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getNormativeActs(name);
  }

  Future<Iterable<NormativeActArticle>> _onNormativeActArticleSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getNormativeActArticles(index, name);
  }

  Future<Iterable<ViolationType>> _onViolationTypeSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getViolationTypes(name);
  }

  Future<Iterable<ViolatorType>> _onViolatorTypeSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getViolatorTypes(name);
  }

  Future<Iterable<DepartmentCode>> _onDepartmentCodeSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getDepartmentCodes(name);
  }

  Future<Iterable<dynamic>> _onViolatorSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getViolators(index, name);
  }

  Future<Iterable<dynamic>> _onViolatorDocumentTypeSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getViolatorDocumentTypes(name);
  }

  void _onSave(BuildContext context, int status) {
    bool validViolators = true;
    final report = BlocProvider.of<TotalReportBloc>(context).state.report;
    final resViolators = List<Violator>();
    final curViolators = report.violation?.violators ?? [];
    
    for (int i = 0; i < curViolators.length; i++) {
      final violator = curViolators[i];
      final violatorPerson = violator.violatorPerson;
      if (!violator.violatorNotFound) {
        if (violatorPerson?.id == null) {
          validViolators = validViolators && _violatorFormKeys[i].currentState.validate();
          if (violator?.type?.id == ViolatorTypeIds.legal) {
            final newViolator = violator.copyWith(
              violatorPerson: ViolatorInfoLegal(
                name: _violatorControllers[i].text,
                phone: _phoneControllers[i].text,
                inn: _innControllers[i].text,
                ogrn: _ogrnControllers[i].text,
                kpp: _kppControllers[i].text,
                regDate: _registerDates[i],
              ),
            );
            resViolators.add(newViolator);
          } else if (violator?.type?.id == ViolatorTypeIds.official) {
            final newViolator = violator.copyWith(
              violatorPerson: ViolatorInfoOfficial(
                orgName: _violatorControllers[i].text,
                phone: _phoneControllers[i].text,
                orgInn: _innControllers[i].text,
                orgOgrn: _ogrnControllers[i].text,
                orgKpp: _kppControllers[i].text,
                orgRegDate: _registerDates[i],
              ),
            );
            resViolators.add(newViolator);
          } else if (violator?.type?.id == ViolatorTypeIds.ip) {
            final newViolator = violator.copyWith(
              violatorPerson: ViolatorInfoIp(
                name: _violatorControllers[i].text,
                firstName: _firstNameControllers[i].text,
                lastName: _lastNameControllers[i].text,
                patronym: _patronymControllers[i].text,
                phone: _phoneControllers[i].text,
                snils: _snilsControllers[i].text,
                inn: _innControllers[i].text,
                ogrnip: _ogrnControllers[i].text,
                registrationDate: _registerDates[i],
                birthDate: _birthDates[i],
              ),
            );
            resViolators.add(newViolator);
          } else if (violator?.type?.id == ViolatorTypeIds.private) {
            final newViolator = violator.copyWith(
              violatorPerson: ViolatorInfoPrivate(
                firstName: _firstNameControllers[i].text,
                lastName: _lastNameControllers[i].text,
                patronym: _patronymControllers[i].text,
                phone: _phoneControllers[i].text,
                snils: _snilsControllers[i].text,
                inn: _innControllers[i].text,
                docNumber: _docNumberControllers[i].text,
                docSeries: _docSeriesControllers[i].text,
                docType: (violator?.violatorPerson as ViolatorInfoPrivate)?.docType,
                birthDate: _birthDates[i],
              ),
            );
            resViolators.add(newViolator);
          }
        } else {
          resViolators.add(violator);
        }
      } else {
        resViolators.add(violator);
      }
    }
    if (report.violationNotPresent) {
      BlocProvider.of<TotalReportBloc>(context).add(
        SaveEvent(
          status: status,
          photos: _photos
        ),
      );  
    } else {
      if (_formKey.currentState.validate() && validViolators) {
        BlocProvider.of<TotalReportBloc>(context).add(
          SaveEvent(
            status: status,
            violators: resViolators,
            violationDescription: _violationDescriptionController.text,
            specifiedAddress: _specifiedAddressController.text,
            codexArticle: _codexArticleController.text,
            photos: _photos
          ),
        );  
      }
    }
  }

  void _onDeleteReport(BuildContext context) {
    BlocProvider.of<TotalReportBloc>(context).add(DeleteEvent());  
  }

  void _showSnackBar(BuildContext context, String title) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ProjectColors.darkBlue,
            content: Text(title),
            duration: Duration(seconds: 5),
          ),
        );
        BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
      }
    );
  }

  void _centerMap(BuildContext context, LatLng location) {
    _mapController.move(location, 16.5);
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _addViolatorInfo(int index, dynamic violator) {
    _violatorControllers[index].text = violator?.toString()?? '';
    if (violator is ViolatorInfoLegal) {
      _legalToControllers(index, violator);
    } else if (violator is ViolatorInfoOfficial) {
      _officialToControllers(index, violator);
    } else if (violator is ViolatorInfoPrivate) {
      _privateToControllers(index, violator);
    } else if (violator is ViolatorInfoIp) {
      _ipToControllers(index, violator);
    } else {
      for (final list in _allViolatorControllers) {
        list[index].clear();
      }
      _registerDates[index] = null;
      _birthDates[index] = null;
    }
  }

  void _legalToControllers(int index, ViolatorInfoLegal violator) {
    _innControllers[index].text = violator.inn ?? '';
    _ogrnControllers[index].text = violator.ogrn ?? '';
    _kppControllers[index].text = violator.kpp ?? '';
    _phoneControllers[index].text = violator.phone ?? '';
    _legalAddressControllers[index].text = violator.legalAddress?.toString() ?? '';
    _postalAddressControllers[index].text = violator.postalAddress?.toString() ?? '';
    _registerDates[index] = violator.regDate;
  } 

  void _officialToControllers(int index, ViolatorInfoOfficial violator) {
    _innControllers[index].text = violator.orgInn ?? '';
    _ogrnControllers[index].text = violator.orgOgrn ?? '';
    _kppControllers[index].text = violator.orgKpp ?? '';
    _phoneControllers[index].text = violator.phone ?? '';
    _legalAddressControllers[index].text = violator.orgLegalAddress?.toString() ?? '';
    _postalAddressControllers[index].text = violator.orgPostalAddress?.toString() ?? '';
    _registerDates[index] = violator.orgRegDate;
  } 

  void _ipToControllers(int index, ViolatorInfoIp violator) {
    _firstNameControllers[index].text = violator.firstName ?? '';
    _lastNameControllers[index].text = violator.lastName ?? '';
    _patronymControllers[index].text = violator.patronym ?? '';
    _innControllers[index].text = violator.inn ?? '';
    _ogrnControllers[index].text = violator.ogrnip ?? '';
    _snilsControllers[index].text = violator.snils ?? '';
    _phoneControllers[index].text = violator.phone ?? '';
    _birthPlaceControllers[index].text = violator.birthPlace ?? '';
    _registrationAddressControllers[index].text = violator.registrationAddress?.toString() ?? '';
    _registerDates[index] = violator.registrationDate;
    _birthDates[index] = violator.birthDate;
  } 

  void _privateToControllers(int index, ViolatorInfoPrivate violator) {
    _firstNameControllers[index].text = violator.firstName ?? '';
    _lastNameControllers[index].text = violator.lastName ?? '';
    _patronymControllers[index].text = violator.patronym ?? '';
    _docSeriesControllers[index].text = violator.docSeries ?? '';
    _docNumberControllers[index].text = violator.docNumber ?? '';
    _docTypeControllers[index].text = violator.docType?.toString() ?? '';
    _innControllers[index].text = violator.inn ?? '';
    _snilsControllers[index].text = violator.snils ?? '';
    _phoneControllers[index].text = violator.phone ?? '';
    _birthPlaceControllers[index].text = violator.birthPlace ?? '';
    _registrationAddressControllers[index].text = violator.registrationAddress?.toString() ?? '';
    _birthDates[index] = violator.birthDate;
  } 

  void _addViolatorControllers() {
    _violatorFormKeys.add(GlobalKey<FormState>());
    for (final list in _allViolatorControllers) {
      list.add(TextEditingController());
    }
    _violatorTypeControllers.add(TextEditingController());
    _birthDates.add(null);
    _registerDates.add(null);
  }

  void _addNormativeActControllers() {
    _normativeActControllers.add(TextEditingController());
    _normativeActArticleControllers.add(TextEditingController());
  }

  void _clearViolatorControllers(int index) {
    for (final list in _allViolatorControllers) {
      list[index].clear();
    }
  }

  void _loadDict(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          child: DictionaryDialog()
        );
        BlocProvider.of<TotalReportBloc>(context).add(InitEvent(widget.report));  
      }
    );
  }

  void _back() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        Navigator.pop(context, true);
      }
    );
  }

  String _nullValidator(dynamic value) {
    if (value == null) {
      return 'Введите значение';
    }
  }

  String _emptyValidator(String value) {
    if (value.isEmpty) {
      return 'Введите значение';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> TotalReportBloc(TotalReportBlocState(widget.report, null))..add(LoadEvent(widget.report)),
      child: BlocBuilder<TotalReportBloc, TotalReportBlocState>(
        builder: (context, state) {
          if (state is LoadDictState) {
            _loadDict(context);
          } else if (state is LocationLoadedState) {
            _centerMap(context, state.location);
          } else if (state is SuccessState) { 
            _showSnackBar(context, 'Рапорт успешно сформирован');
            _back();
          } else if (state is DeletedState) { 
            _showSnackBar(context, 'Рапорт удален');
            _back();
          } else if (state is ErrorState) {
            _showSnackBar(context, 'Произошла ошибка. ${state.exception.message} ${state.exception.details}');
          } 
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ProjectAppbar('Рапорт ${widget.report.reportNum ?? ''}'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    _buildCheckBox(
                      'Данные, указывающие на наличие события нарушения, не установлены', 
                      state.report.violationNotPresent,
                      (value)=> _onViolationNotPresent(context, value),
                      padding: EdgeInsets.zero, 
                      style: ProjectTextStyles.baseBold,
                    ),
                    state.report.violationNotPresent ? _buildViolationNotPresent(context, state) : _buildViolationPresent(context, state),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );  
  }

  Widget _buildAddressDialog() {
    return Column(
      children: [
        
      ],
    );
  }

  Widget _buildViolationNotPresent(BuildContext context, TotalReportBlocState state) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImagePicker(
            images: _photos,
            enabled: editable,
            onPicked: (file) => _onPhotoPick(context, file),
          ),
          _buildButtons(context),
        ],
      ),
    );
  }
  
  Widget _buildViolationPresent(BuildContext context, TotalReportBlocState state) {
    return Column(
      children: [
        _buildMap(state),
        _buildAutocomplete(
          'Ручной поиск по карте', 
          'Введите или выберите значение', 
          _searchController,
          (value)=> _onMapSearch(context, value), 
          (value)=> _onMapSearchSelect(context, value),
        ),
        _buildTitle('Адрес нарушения'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: _buildCheckBox(
                      'Определить адрес по местоположению', 
                      state.report.violationNotPresent,
                      (value)=> {}
                      //(value)=> _onViolationNotPresent(context, value),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildCheckBox(
                      'ТиНАО', 
                      state.report.violationNotPresent,
                      (value)=> {}//_onViolationNotPresent(context, value),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildAutocomplete(
                      'Округ', 
                      'Выберите значение', 
                      _areaController,
                      (value)=> _onAreaSearch(context, value), 
                      (value)=> _onAreaSelect(context, value),
                      validator: (value) => _nullValidator(state.report?.violation?.violationAddress?.area)
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildAutocomplete(
                      'Район', 
                      'Выберите значение', 
                      _districtController,
                      (value)=> _onDistrictSearch(context, value), 
                      (value)=> _onDistrictSelect(context, value),
                      validator: (value) => _nullValidator(state.report?.violation?.violationAddress?.district)
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildAutocomplete(
                      'Улица', 
                      'Выберите значение', 
                      _streetController,
                      (value)=> _onStreetSearch(context, value), 
                      (value)=> _onStreetSelect(context, value),
                      validator: (value) => _nullValidator(state.report?.violation?.violationAddress?.street)
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildAutocomplete(
                      'Дом, корпус, строение', 
                      'Выберите значение', 
                      _addressController,
                      (value)=> _onAddressSearch(context, value), 
                      (value)=> _onAddressSelect(context, value),
                      validator: (value) => _nullValidator(state.report?.violation?.violationAddress?.houseNum),
                    ),
                  ),
                ],
              ),
              _buildTextField('Адресный ориентир', 'Введите данные', _specifiedAddressController),
              _buildTitle('Нарушение'),
              _buildAutocomplete(
                'Код объекта контроля', 
                'Выберите значение', 
                _objectCategoryController,
                (value)=> _onObjectCategoriesSearch(context, value), 
                (value)=> _onObjectCategorySelect(context, value),
                validator: (value) => _nullValidator(state.report?.violation?.objectCategory),
              ),
              _buildTextField('Описание нарушения', 'Введите данные', _violationDescriptionController,
                validator: _emptyValidator
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: List.generate(state.report.violation?.normativeActArticles?.length ?? 1, 
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            _buildAutocomplete(
                              'Нормативно-правовой акт', 
                              'Выберите значение', 
                              _normativeActControllers[index],
                              (value)=> _onNormativeActSearch(context, value), 
                              (value)=> _onNormativeActSelect(context, index, value), 
                              validator: (value) => _nullValidator(state.report?.violation?.normativeActArticles[index].normativeActId),
                              padding: const EdgeInsets.only(right: 30)
                            ),
                            _buildAutocomplete(
                              'Пункт', 
                              'Выберите значение', 
                              _normativeActArticleControllers[index],
                              (value)=> _onNormativeActArticleSearch(context, index, value), 
                              (value)=> _onNormativeActArticleSelect(context, index, value), 
                              validator: (value) => _nullValidator(state.report?.violation?.normativeActArticles[index].id),
                              padding: const EdgeInsets.only(top: 20, right: 30)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildConnector(context, state.report.violation?.normativeActArticles?.length ?? 1),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: _buildAutocomplete(
                      'Код нарушения', 
                      'Выберите значение', 
                      _violationTypeController,
                      (value)=> _onViolationTypeSearch(context, value),
                      (value)=> _onViolationTypeSelect(context, value), 
                      validator: (value)=> _nullValidator(state.report?.violation?.violationType)
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildTextField('Статья КоАП', 'Введите данные', _codexArticleController,
                      validator: _emptyValidator
                    ),
                  ),
                ],
              ),
              _buildTitle('Фотоматериалы нарушения'),
              ImagePicker(
                images: _photos,
                enabled: editable,
                onPicked: (file)=> _onPhotoPick(context, file),
                onRemoved: (index)=> _onPhotoRemove(context, index)
              ),
            ],
          ),
        ),
        _buildTitle('Нарушители'),
        Column(
          children: List.generate(state.report.violation?.violators?.length ?? 1, 
            (index) => _buildViolator(context, state.report.violation?.violators?.elementAt(index) ?? Violator.empty(), index),
          ),
        ),
        _buildAddViolator(context),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildViolator(BuildContext context, Violator violator, int index) {
    return Column(
      children: [
        _buildCheckBox(
          'Нарушитель не выявлен', 
          violator.violatorNotFound,
          (value)=> _onViolatorNotFound(context, value, index),
        ),
        violator.violatorNotFound ? Container() :
        Form(
          key: _violatorFormKeys[index],
          child: Column(
            children: [
              _buildAutocomplete('Тип нарушителя', 'Выберите значение',  
                _violatorTypeControllers[index],
                (value)=> _onViolatorTypeSearch(context, value), 
                (value)=> _onViolatorTypeSelect(context, index, value), 
                validator: (value) => _nullValidator(violator?.type)
              ),
              _buildAutocomplete('Нарушитель', 'Выберите значение',  
                _violatorControllers[index],
                (value)=> _onViolatorSearch(context, index, value), 
                (value)=> _onViolatorSelect(context, index, value), 
              ),
              _buildViolatorInfo(context, index, violator)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildViolatorInfo(BuildContext context, int index, Violator violator) {
    if (violator?.type?.id == ViolatorTypeIds.official) {
      return _buildOfficial(context, index, violator);
    } else if (violator?.type?.id == ViolatorTypeIds.private) {
      return _buildPrivate(context, index, violator);
    } else if (violator?.type?.id == ViolatorTypeIds.ip) {
      return _buildIp(context, index, violator);
    } else {
      return _buildLegal(context, index, violator);
    }
  }

  Widget _buildLegal(BuildContext context, int index, Violator violator) {
    final enabled = violator?.violatorPerson?.id == null;
    final textValidator = enabled ? _emptyValidator : null;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРН', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('КПП', 'Введите данные', _kppControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProjectDatePicker(
                  title: 'Дата регистрации',
                  hintText: 'Выберите дату',
                  singleDate: true,
                  enabled: editable && enabled,
                  values: _registerDates[index] != null ? [_registerDates[index] ] : null,
                  onChanged: (date) => _onRegisterDateSelect(context, index, date),
                  validator: enabled ? (value) => _nullValidator(_registerDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildCheckBox(
                'Иностранное Юрлицо', 
                violator.foreign,
                (value)=> _onViolatorForeign(context, value, index),
                enabled: enabled,
                padding: const EdgeInsets.only(top: 40),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Код ведомства', 
                'Выберите значение',  
                _departmentCodeControllers[index],
                (value)=> _onDepartmentCodeSearch(context, value),
                (value)=> _onDepartmentCodeSelect(context, index, value), 
                enabled: enabled,
                validator: enabled ? (value) => _nullValidator(violator?.departmentCode) : null
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        _buildTextField('Фактический адрес', 'Введите данные', _legalAddressControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Юридический адрес', 'Введите данные', _postalAddressControllers[index], enabled: enabled, validator: textValidator),
      ],
    );
  }

  Widget _buildOfficial(BuildContext context, int index, Violator violator) {
    final enabled = violator?.violatorPerson?.id == null;
    final textValidator = enabled ? _emptyValidator : null;
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildTextField('ИНН организации', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРН организации', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('КПП организации', 'Введите данные', _kppControllers[index], enabled: enabled, validator: textValidator,)
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProjectDatePicker(
                  title: 'Дата регистрации организации',
                  hintText: 'Выберите дату',
                  singleDate: true,
                  enabled: editable && enabled,
                  values: _registerDates[index] != null ? [_registerDates[index] ] : null,
                  onChanged: (date) => _onRegisterDateSelect(context, index, date),
                  validator: enabled ? (value) => _nullValidator(_registerDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildCheckBox(
                'Иностранное Юрлицо', 
                violator.foreign,
                (value)=> _onViolatorForeign(context, value, index),
                enabled: enabled,
                padding: const EdgeInsets.only(top: 40),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Код ведомства', 
                'Выберите значение',  
                _departmentCodeControllers[index],
                (value)=> _onDepartmentCodeSearch(context, value),
                (value)=> _onDepartmentCodeSelect(context, index, value), 
                enabled: enabled,
                validator: enabled ? (value) => _nullValidator(violator?.departmentCode) : null
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        _buildTextField('Фактический адрес', 'Введите данные', _legalAddressControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Юридический адрес', 'Введите данные', _postalAddressControllers[index], enabled: enabled, validator: textValidator),
      ],
    );
  }

  Widget _buildPrivate(BuildContext context, int index, Violator violator) {
    final enabled = violator?.violatorPerson?.id == null;
    final person = violator.violatorPerson as ViolatorInfoPrivate;
    final textValidator = enabled ? _emptyValidator : null;
    return Column(
      children: [
        _buildTextField('Фамилия', 'Введите данные', _lastNameControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Имя', 'Введите данные', _firstNameControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Отчество', 'Введите данные', _patronymControllers[index], enabled: enabled, validator: textValidator),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Тип документа', 
                'Выберите значение', 
                _docTypeControllers[index],
                (value)=> _onViolatorDocumentTypeSearch(context, value), 
                (value)=> _onViolatorDocumentTypeSelect(context, index, value), 
                validator: enabled ? (value) => _nullValidator(person?.docType) : null,
                enabled: enabled,
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('Серия документа', 'Введите данные', _docSeriesControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('Номер документа', 'Введите данные', _docNumberControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('СНИЛС', 'Введите данные', _snilsControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProjectDatePicker(
                  title: 'Дата рождения',
                  hintText: 'Выберите дату',
                  singleDate: true,
                  enabled: editable && enabled,
                  values: _birthDates[index] != null ? [_birthDates[index]] : null,
                  onChanged: (date) => _onBirthDateSelect(context, index, date),
                  validator: enabled ? (value) => _nullValidator(_birthDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child :_buildTextField('Место рождения', 'Введите данные', _birthPlaceControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        _buildTextField('Адрес регистрации', 'Введите данные', _registrationAddressControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, validator: textValidator),
      ],
    );  
  }

  Widget _buildIp(BuildContext context, int index, Violator violator) {
    final enabled = violator?.violatorPerson?.id == null;
    final textValidator = enabled ? _emptyValidator : null;
    return Column(
      children: [
        _buildTextField('Фамилия', 'Введите данные', _lastNameControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Имя', 'Введите данные', _firstNameControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Отчество', 'Введите данные', _patronymControllers[index], enabled: enabled, validator: textValidator),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРНИП', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: textValidator),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('СНИЛС', 'Введите данные', _snilsControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ProjectDatePicker(
            title: 'Дата регистрации',
            hintText: 'Выберите дату',
            singleDate: true,
            enabled: editable && enabled,
            values: _registerDates[index] != null ? [_registerDates[index] ] : null,
            onChanged: (date) => _onRegisterDateSelect(context, index, date),
            validator: enabled ? (value) => _nullValidator(_registerDates[index]) : null
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ProjectDatePicker(
                  title: 'Дата рождения',
                  hintText: 'Выберите дату',
                  singleDate: true,
                  enabled: editable && enabled,
                  values: _birthDates[index] != null ? [_birthDates[index] ] : null,
                  onChanged: (date) => _onBirthDateSelect(context, index, date),
                  validator: enabled ? (value) => _nullValidator(_birthDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child :_buildTextField('Место рождения', 'Введите данные', _birthPlaceControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        _buildTextField('Адрес регистрации', 'Введите данные', _registrationAddressControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, validator: textValidator),
      ],
    );
  }

  Widget _buildAddViolator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: ()=> _onAddViolator(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.add_circle,
                color: ProjectColors.green,
                size: 20,
              ),
            ),
            Text('Добавить нарушителя',
              style: ProjectTextStyles.baseBold.apply(color: ProjectColors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    final report = widget.report;
    final newReport = (report.reportStatus == null || report.reportStatus?.id == ReportStatusIds.new_ || report.reportStatus?.id == ReportStatusIds.project);
    final deletable = report.reportStatus != null && newReport;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectButton.builtFlatButton('Сохранить проект',
            onPressed: newReport ? () => _onSave(context, ReportStatusIds.project) : null,
          ),
          ProjectButton.builtFlatButton('Сохранить',
            onPressed: newReport ? ()=> _onSave(context, ReportStatusIds.new_) : null,
          ),
          ProjectButton.builtFlatButton('На согласование',
            onPressed: editable ? ()=>_onSave(context, ReportStatusIds.onApproval) : null,
          ),
          ProjectButton.builtFlatButton('Удалить', 
            color: ProjectColors.red,
            disabledColor: ProjectColors.red.withOpacity(0.3),
            onPressed: deletable ? ()=> _onDeleteReport(context) : null
          ),
        ],
      ),
    );
  }

  Widget _buildMap(TotalReportBlocState state) {
    final markers = List<Marker>();
    if (state.location != null) {
      markers.add(
        Marker(
          point: state.location,
          builder: (context) => Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ProjectColors.blue
            ),
          ),
        ),
      );
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.only(top: 24),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(55.746875, 37.6200),
              zoom: 16.5  ,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']
              ),
              MarkerLayerOptions(
                markers: markers
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              //alignment: Alignment.topRight,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPinButton(Icons.add, ProjectColors.green),
                  _buildPinButton(Icons.close, ProjectColors.red),
                  _buildPinButton(Icons.play_arrow, ProjectColors.cyan)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinButton(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.location_on,
              color: ProjectColors.darkBlue,
              size: 22,
            ),
          ),
          Icon(icon,
            size: 12,
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildConnector(BuildContext context, int count) {
    final border = BorderSide(color: ProjectColors.lightBlue); 
    return Stack(
      children: [
        Container(
          width: 20,
          height: count * 92 * 2.0 - 92,
          margin: const EdgeInsets.only(top: 65, right: 10),
          decoration: BoxDecoration(
            border: Border(top: border, right: border, bottom: border),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: count == 1 ? 105 : 95.0 * count),
          child: InkWell(
            onTap: ()=> _onAddNormativeAct(context),
            child: Icon(Icons.add_circle,
              color: ProjectColors.green,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckBox(
    String title, 
    bool value, 
    Function(bool) onChanged, {
      TextStyle style, 
      bool enabled = true,
      EdgeInsets padding = const EdgeInsets.only(top: 20)
    }
  ) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          ProjectCheckbox(
            value: value,
            onChanged: editable && enabled ? onChanged : (v){},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title,
              style: (style ?? ProjectTextStyles.base).apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  } 

  Widget _buildTextField(String title, 
    String hintText, 
    TextEditingController controller, {
      Function(String) validator,
      EdgeInsets padding = const EdgeInsets.only(top: 20),
      bool enabled = true
    }
  ) {
    return Padding(
      padding: padding,
      child: ProjectTextField(
        title: title,
        hintText: hintText, 
        controller: controller,
        validator: validator,
        enabled: editable && enabled, 
      )
    );
  }

  Widget _buildAutocomplete(
    String title, 
    String hintText, 
    TextEditingController controller,
    AutocompleteCallback suggestionsCallback, 
    Function(dynamic) onSuggestionSelected, {
      Function(String) validator,
      bool enabled = true,
      EdgeInsets padding = const EdgeInsets.only(top: 20),
    }
  ) {
    return Padding(
      padding: padding,
      child: ProjectAutocomplete(title,
        controller: controller,
        hintText: hintText,
        suggestionsCallback: suggestionsCallback,
        onSuggestionSelected: onSuggestionSelected,
        validator: validator,
        enabled: editable && enabled,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return ProjectTitle(title);
  }
}
