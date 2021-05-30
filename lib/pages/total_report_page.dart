import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:inspector/model/kladdr_address_object_type.dart';
import 'package:inspector/model/report_status_info.dart';
import 'package:inspector/widgets/instruction/resolution.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

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
import 'package:inspector/model/violation.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/style/accept_dialog.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/checkbox.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:inspector/style/image_picker.dart';
import 'package:latlong/latlong.dart';

class TotalReportPage extends StatefulWidget {

  // final bool violationNotPresent;
  // final int instructionId;
  // final int checkId;
  final int violationIndex;
  final Report report;

  TotalReportPage({this.report, this.violationIndex = 0});

  @override
  TotalReportPageState createState() => TotalReportPageState();
}

class TotalReportPageState extends State<TotalReportPage> with SingleTickerProviderStateMixin {

  final _formKey = GlobalKey<FormState>();
  final _addressDialogKey = GlobalKey<FormState>();

  final _mapController = MapController();

  // todo: move to state
  bool _markEditing = false;
  bool _addressByLocation = false;
  bool _tinao = false;

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
  final _addressDialogIndexController = TextEditingController();
  final _addressDialogAutoSubjectTypeController = TextEditingController();
  final _addressDialogAutoSubjectController = TextEditingController();
  final _addressDialogAutoRegionTypeController = TextEditingController();
  final _addressDialogAutoRegionController = TextEditingController();
  final _addressDialogAutoCityTypeController = TextEditingController();
  final _addressDialogAutoCityController = TextEditingController();
  final _addressDialogAutoPlaceTypeController = TextEditingController();
  final _addressDialogAutoPlaceController = TextEditingController();
  final _addressDialogAutoStreetTypeController = TextEditingController();
  final _addressDialogAutoStreetController = TextEditingController();
  final _addressDialogHouseController = TextEditingController();
  final _addressDialogBuildingController = TextEditingController();
  final _addressDialogBuildingExtController = TextEditingController();
  final _addressDialogFlatController = TextEditingController();

  final _normativeActControllers = [
    TextEditingController()
  ];
  final _normativeActArticleControllers = [
    TextEditingController()
  ];
  final List<Uint8List> _photos = [

  ];
  final List<String> _photoNames = [

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
        final photo = widget.report.photos[i];
        final image = decoder.convert(photo.data);
        _photos.add(image);
        _photoNames.add(photo.name);
      }
    } else {
      final violation = widget.report.violation(widget.violationIndex);
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

        if (TotalReportBloc.tinaoAreas.contains(violation.violationAddress?.area?.id)) {
          _tinao = true;
        }

        final decoder = Base64Decoder();
        for (int i = 0; i < violation.photos.length; i++) {
          final image = decoder.convert(violation.photos[i].data);
          _photos.add(image);
          _photoNames.add(violation.photos[i].name);
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
          if ( violation.violators[i].type != null) {
            _violatorTypeControllers[i].text = violation.violators[i].type.toString();
          }
          if (violation.violators[i].departmentCode != null) {
            _departmentCodeControllers[i].text = violation.violators[i].departmentCode.toString();
          }
          final violator = violation.violators[i].violatorPerson;
          if (violator != null) {
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
        _mapController.move(LatLng(address.lat, address.lng), 17.5);
      }
    }
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onMapTap(BuildContext context, LatLng location) {
    if (_markEditing) {
      BlocProvider.of<TotalReportBloc>(context).add(SetViolationLocationEvent(location));
      _markEditing = false;
    }
  }

  void _onMapEdit(BuildContext context) {
    _markEditing = true;
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onMapClear(BuildContext context) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationLocationEvent(null));
  }

  void _onMapCenter(BuildContext context) {
    final state = BlocProvider.of<TotalReportBloc>(context).state;
    if (state.violationLocation != null) {
      _mapController.move(state.violationLocation, 17.5);
    }
  }

  void _onAddressByLocation(BuildContext context, bool value) async {
    _addressByLocation = value;
    if (value) {
      _showSnackBar(context, 'Идет поиск адреса');
      await Future.delayed(Duration(seconds: 1));
      BlocProvider.of<TotalReportBloc>(context).add(SearchAddressByLocation());
    } else {
      BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
    }
  }

  void _onTinao(BuildContext context, bool value) {
    _tinao = value;
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onAddressDialogSelect(BuildContext context, ViolatorAddress address) {
    _violatorAddressToControllers(address);
    BlocProvider.of<TotalReportDialogBloc>(context).add(TotalReportDialogBlocEvent(address));
  }

  void _onAddressDialogSubjectTypeSelect(BuildContext context, KladdrAddressObjectType address) {
    _addressDialogAutoSubjectTypeController.text = address?.name;
  }

  void _onAddressDialogRegionTypeSelect(BuildContext context, KladdrAddressObjectType address) {
    _addressDialogAutoRegionTypeController.text = address?.name;
  }

   void _onAddressDialogCityTypeSelect(BuildContext context, KladdrAddressObjectType address) {
    _addressDialogAutoCityTypeController.text = address?.name;
  }

   void _onAddressDialogPlaceTypeSelect(BuildContext context, KladdrAddressObjectType address) {
    _addressDialogAutoPlaceTypeController.text = address?.name;
  }

   void _onAddressDialogStreetTypeSelect(BuildContext context, KladdrAddressObjectType address) {
    _addressDialogAutoStreetTypeController.text = address?.name;
  }

  void _onAddressDialogClose(BuildContext context, ViolatorAddress address) {
    if (_addressDialogKey.currentState.validate()) {
      Navigator.pop(context,
        (address ?? ViolatorAddress()).copyWith(
          zipCode: _addressDialogIndexController.text,
          subjectName: _addressDialogAutoSubjectController.text,
          regionName: _addressDialogAutoRegionController.text,
          cityName: _addressDialogAutoCityController.text,
          placeName: _addressDialogAutoPlaceController.text,
          streetName: _addressDialogAutoStreetController.text,
          house: _addressDialogHouseController.text,
          building: _addressDialogBuildingController.text,
          flat: _addressDialogFlatController.text,
          buildingExt: _addressDialogBuildingExtController.text,
        )
      );
    }
  }

  void _onLegalAddressSelect(BuildContext context, int index, ViolatorAddress address) {
    _legalAddressControllers[index].text = address.toString();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorLegalAddressEvent(index, address));
  }

  void _onPostalAddressSelect(BuildContext context, int index, ViolatorAddress address) {
    _postalAddressControllers[index].text = address.toString();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorPostalAddressEvent(index, address));
  }

  void _onRegistrationAddressSelect(BuildContext context, int index, ViolatorAddress address) {
    _registrationAddressControllers[index].text = address.toString();
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorRegistrationAddressEvent(index, address));
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

  void _onStreetSelect(BuildContext context, Street value) async {
    final bloc = BlocProvider.of<TotalReportBloc>(context);
    _streetController.text = value?.toString() ?? '';
    if (value != null) {
      final area = await bloc.getArea(value.areaId);
      if (area != null) {
        _areaController.text = area.toString();
      }
      final district = await bloc.getDistrict(value.districtId);
      if (district != null) {
        _districtController.text = district.toString();
      }
    }
    _addressController.clear();
    bloc.add(SetViolationStreetEvent(value));
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

  void _onNormativeActDelete(BuildContext context, int index) {
    _normativeActControllers.removeAt(index);
    _normativeActArticleControllers.removeAt(index);
    BlocProvider.of<TotalReportBloc>(context).add(DeleteViolationNormativeActEvent(index));
  }

  void _onNormativeActArticleSelect(BuildContext context, int index, NormativeActArticle value) {
    _normativeActArticleControllers[index].text = value?.toString() ?? '';
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationNormativeActArticleEvent(index, value));
  }

  void _onPhotoPick(BuildContext context, File file) {
    _photos.add(file.readAsBytesSync());
    _photoNames.add(p.basename(file.path));
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onPhotoRotate(BuildContext context, int index, Uint8List image) {
    _photos[index] = image;
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

  void _onPhotoRemove(BuildContext context, int index) {
    _photos.removeAt(index);
    _photoNames.removeAt(index);
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
  }

   void _onViolationTypeSelect(BuildContext context, ViolationType value) {
    _violationTypeController.text = value?.toString() ?? '';
    _codexArticleController.text = value?.koap ?? '';
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
    if (widget.report.isUpdatable) {
      _addNormativeActControllers();
      BlocProvider.of<TotalReportBloc>(context).add(AddViolationActEvent());
    }
  }

  void _onAddViolator(BuildContext context) {
    if (widget.report.isUpdatable) {
      _addViolatorControllers();
      BlocProvider.of<TotalReportBloc>(context).add(AddViolatorEvent());
    }
  }

  void _onViolatorSelect(BuildContext context, int index, dynamic violator) {
    _addViolatorInfo(index, violator);
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorInfoEvent(index, violator));
  }

   void _onViolatorDelete(BuildContext context, int index) {
    if (widget.report.isUpdatable) {
      _removeViolatorControllers(index);
      BlocProvider.of<TotalReportBloc>(context).add(DeleteViolatorEvent(index));
    }
  }

  Future<Iterable<KladdrAddressObjectType>> _onAddressDialogSubjectTypeSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getKladdrAddressType(name, 'SUBJECT');
  }

  Future<Iterable<KladdrAddressObjectType>> _onAddressDialogRegionTypeSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getKladdrAddressType(name, 'REGION');
  }

  Future<Iterable<KladdrAddressObjectType>> _onAddressDialogCityTypeSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getKladdrAddressType(name, 'CITY');
  }

  Future<Iterable<KladdrAddressObjectType>> _onAddressDialogPlaceTypeSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getKladdrAddressType(name, 'PLACE');
  }

  Future<Iterable<KladdrAddressObjectType>> _onAddressDialogStreetTypeSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getKladdrAddressType(name, 'STREET');
  }

  Future<Iterable<ViolatorAddress>> _onAddressDialogSubjectSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getAddressSubjects(index, name);
  }

  Future<Iterable<ViolatorAddress>> _onAddressDialogRegionSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getAddressRegions(index, name);
  }

  Future<Iterable<ViolatorAddress>> _onAddressDialogCitySearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getAddressCities(index, name);
  }

  Future<Iterable<ViolatorAddress>> _onAddressDialogSettlementSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getAddressSettlements(index, name);
  }

  Future<Iterable<ViolatorAddress>> _onAddressDialogStreetSearch(BuildContext context, int index, String name) async {
    return await BlocProvider.of<TotalReportDialogBloc>(context).getAddressStreets(index, name);
  }

  Future<Iterable<AddressSearch>> _onMapSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getSearchAddresses(name);
  }

  Future<Iterable<Area>> _onAreaSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getAreas(name, _tinao);
  }

  Future<Iterable<District>> _onDistrictSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getDistricts(name, _tinao);
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

  void _onAddressDialog(BuildContext context, int index, ViolatorAddress address, Function(BuildContext, int index, ViolatorAddress) onSelect) async {
    _addressDialogIndexController.clear();
    _addressDialogAutoSubjectController.clear();
    _addressDialogAutoRegionController.clear();
    _addressDialogAutoPlaceController.clear();
    _addressDialogAutoCityController.clear();
    _addressDialogAutoStreetController.clear();
    _addressDialogHouseController.clear();
    _addressDialogBuildingController.clear();
    _addressDialogBuildingExtController.clear();
    _addressDialogFlatController.clear();
    _violatorAddressToControllers(address);
    final res = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _buildAddressDialog(context, index, address)
    );
    if (res != null) {
      if (res is ViolatorAddress) {
        onSelect(context, index, res);
      }
    }
  }

  void _onSave(BuildContext context, int status) async {
    final report = BlocProvider.of<TotalReportBloc>(context).state.report;
    final date = report.reportDate ?? DateTime.now();
    final number = report.reportNum != null ?  '№ ${report.reportNum}' : '';
    final res = await showDialog(
      context: context,
      builder: (ctx) => AcceptDialog(
        acceptTitle: 'Да',
        cancelTitle: 'Нет',
        message: status == ReportStatusIds.onApproval ? 'Вы подтверждаете передачу рапорта $number от ${DateFormat('dd.MM.yyyy').format(date)} на согласование?' : 'Сохранить рапорт?'
      ),
    );
    if (res != null) {
      if (_photos.isEmpty) {
        _showSnackBar(context, 'Пожалуйста, добавьте минимум одну фотографию', flush: false);
      } else {
        if (report.violationNotPresent) {
          _showSnackBar(context, 'Рапорт сохраняется...', flush: false);
          BlocProvider.of<TotalReportBloc>(context).add(
            SaveReportEvent(
              status: status,
              photos: _photos,
              photoNames: _photoNames
            ),
          );
        } else {
          bool validViolators = true;
          final resViolators = <Violator>[];
          final curViolators = report.violation(widget.violationIndex)?.violators ?? [];
          for (int i = 0; i < curViolators.length; i++) {
            final violator = curViolators[i];
            //final violatorPerson = violator.violatorPerson;
            if (!violator.violatorNotFound) {
                validViolators = validViolators && _violatorFormKeys[i].currentState.validate();
                if (violator?.type?.id == ViolatorTypeIds.legal) {
                  final person = (violator?.violatorPerson as ViolatorInfoLegal);
                  final newViolator = violator.copyWith(
                    violatorPerson: person.copyWith(
                      name: _violatorControllers[i].text,
                      phone: _phoneControllers[i].text,
                      inn: _innControllers[i].text,
                      ogrn: _ogrnControllers[i].text,
                      kpp: _kppControllers[i].text,
                      regDate: _registerDates[i],
                      legalAddress: person?.legalAddress,
                      postalAddress: person?.postalAddress
                    ),
                  );
                  resViolators.add(newViolator);
                } else if (violator?.type?.id == ViolatorTypeIds.official) {
                  final person = (violator?.violatorPerson as ViolatorInfoOfficial);
                  final newViolator = violator.copyWith(
                    violatorPerson: person.copyWith(
                      firstName: _firstNameControllers[i].text,
                      lastName: _lastNameControllers[i].text,
                      patronym: _patronymControllers[i].text,
                      orgName: _violatorControllers[i].text,
                      phone: _phoneControllers[i].text,
                      orgInn: _innControllers[i].text,
                      orgOgrn: _ogrnControllers[i].text,
                      orgKpp: _kppControllers[i].text,
                      orgRegDate: _registerDates[i],
                      orgLegalAddress: person?.orgLegalAddress,
                      orgPostalAddress: person?.orgPostalAddress
                    ),
                  );
                  resViolators.add(newViolator);
                } else if (violator?.type?.id == ViolatorTypeIds.ip) {
                  final person = (violator?.violatorPerson as ViolatorInfoIp);
                  final newViolator = violator.copyWith(
                    violatorPerson: person.copyWith(
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
                      birthPlace: _birthPlaceControllers[i].text,
                      registrationAddress: person?.registrationAddress
                    ),
                  );
                  resViolators.add(newViolator);
                } else if (violator?.type?.id == ViolatorTypeIds.private) {
                  final person = (violator?.violatorPerson as ViolatorInfoPrivate);
                  final newViolator = violator.copyWith(
                    violatorPerson: person.copyWith(
                      firstName: _firstNameControllers[i].text,
                      lastName: _lastNameControllers[i].text,
                      patronym: _patronymControllers[i].text,
                      phone: _phoneControllers[i].text,
                      snils: _snilsControllers[i].text,
                      inn: _innControllers[i].text,
                      docNumber: _docNumberControllers[i].text,
                      docSeries: _docSeriesControllers[i].text,
                      docType: person?.docType,
                      birthDate: _birthDates[i],
                      birthPlace: _birthPlaceControllers[i].text,
                      registrationAddress: person?.registrationAddress
                    ),
                  );
                  resViolators.add(newViolator);
                }
              } else {
                resViolators.add(violator);
              }
          }
          if (_formKey.currentState.validate() && validViolators) {
            _showSnackBar(context, 'Рапорт сохраняется...', flush: false);
            BlocProvider.of<TotalReportBloc>(context).add(
              SaveReportEvent(
                status: status,
                violators: resViolators,
                violationDescription: _violationDescriptionController.text,
                specifiedAddress: _specifiedAddressController.text,
                codexArticle: _codexArticleController.text,
                photos: _photos,
                photoNames: _photoNames
              ),
            );
          } else {
            _showSnackBar(context, 'Пожалуйста, проверьте все поля');
          }
        }
      }
    }
  }

  void _onDeleteReport(BuildContext context) async {
    final res = await showDialog(context: context, builder: (ctx) => AcceptDialog(message: 'Удалить рапорт?'));
    if (res != null) {
      BlocProvider.of<TotalReportBloc>(context).add(RemoveReportEvent());
    }
  }

  void _showSuccess(BuildContext context, Report report) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final title = '№${report.reportNum} от ${DateFormat('dd.MM.yyyy').format(report.reportDate)}';
        await showDialog(
          context: context,
          builder: (ctx) => AcceptDialog(
            cancelTitle: null,
            acceptTitle: 'ОК',
            message: report.reportStatus?.id == ReportStatusIds.onApproval ? 'Зарегистрирован рапорт $title' : 'Сохранен рапорт $title'
          )
        );
        Navigator.pop(context);
      }
    );
  }

  void _showSnackBar(BuildContext context, String title, {bool flush = true}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ProjectColors.darkBlue,
            content: Text(title),
            duration: Duration(seconds: 3),
          ),
        );
        if (flush) {
          BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
        }
      }
    );
  }

  void _centerMapToLocation(BuildContext context, LatLng location) async {
    if (location != null) {
      await _mapController.onReady;
      _mapController.move(location, 17.5);
      BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
    }
  }

  void _addViolatorInfo(int index, dynamic violator) {
    _violatorControllers[index].text = violator?.name ?? '';
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

  void _violatorAddressToControllers(ViolatorAddress address) {
    _addressDialogIndexController.text = address?.zipCode ?? _addressDialogIndexController.text;
    _addressDialogAutoSubjectController.text = address?.subjectName ??_addressDialogAutoSubjectController.text;
    _addressDialogAutoRegionController.text = address?.regionName ?? _addressDialogAutoRegionController.text;
    _addressDialogAutoPlaceController.text = address?.placeName ?? _addressDialogAutoPlaceController.text;
    _addressDialogAutoCityController.text = address?.cityName ?? _addressDialogAutoCityController.text;
    _addressDialogAutoStreetController.text = address?.streetName ?? _addressDialogAutoStreetController.text;
    _addressDialogHouseController.text = address?.house ?? _addressDialogHouseController.text;
    _addressDialogBuildingController.text = address?.building ?? _addressDialogBuildingController.text;
    _addressDialogBuildingExtController.text = address?.buildingExt ?? _addressDialogBuildingExtController.text;
    _addressDialogFlatController.text = address?.flat ?? _addressDialogFlatController.text;
  }

  void _legalToControllers(int index, ViolatorInfoLegal violator) {
    _innControllers[index].text = violator.inn ?? '';
    _ogrnControllers[index].text = violator.ogrn ?? '';
    _kppControllers[index].text = violator.kpp ?? '';
    _phoneControllers[index].text = violator.phone ?? '';
    _legalAddressControllers[index].text = violator.legalAddressFormatted;
    _postalAddressControllers[index].text = violator.postalAddressFormatted;
    _registerDates[index] = violator.regDate;
  }

  void _officialToControllers(int index, ViolatorInfoOfficial violator) {
    _firstNameControllers[index].text = violator.firstName ?? '';
    _lastNameControllers[index].text = violator.lastName ?? '';
    _patronymControllers[index].text = violator.patronym ?? '';
    _innControllers[index].text = violator.orgInn ?? '';
    _ogrnControllers[index].text = violator.orgOgrn ?? '';
    _kppControllers[index].text = violator.orgKpp ?? '';
    _phoneControllers[index].text = violator.orgPhone ?? '';
    _legalAddressControllers[index].text = violator.orgLegalAddressFormatted;
    _postalAddressControllers[index].text = violator.orgPostalAddressFormatted;
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
    _registrationAddressControllers[index].text = violator.registerAddressFormatted;
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
    _registrationAddressControllers[index].text = violator.registerAddressFormatted;
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

  void _removeViolatorControllers(int index) {
    _violatorFormKeys.removeAt(index);
    for (final list in _allViolatorControllers) {
      list.removeAt(index);
    }
    _violatorTypeControllers.removeAt(index);
    _birthDates.removeAt(index);
    _registerDates.removeAt(index);
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

  // void _loadDict(BuildContext context) async {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) async {
  //       await showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         child: DictionaryDialog()
  //       );
  //       BlocProvider.of<TotalReportBloc>(context).add(InitEvent(widget.violationIndex, widget.report));
  //     }
  //   );
  // }

  void _setViolationAddress(BuildContext context, Violation violation, LatLng location) async {
    _areaController.text = violation.violationAddress?.area?.toString() ?? '';
    _districtController.text = violation.violationAddress?.district?.toString() ?? '';
    _streetController.text = violation.violationAddress?.street?.toString() ?? '';
    _addressController.text = violation.violationAddress?.toString() ?? '';
    if (location != null) {
      await _mapController.onReady;
      _mapController.move(location, 17.5);
    }
    BlocProvider.of<TotalReportBloc>(context).add(FlushEvent());
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
    return null;
  }

  String _emptyValidator(String value) {
    if (value.isEmpty) {
      return 'Введите значение';
    }
    return null;
  }

  String _innValidator(int index, ViolatorDocumentType docType) {
    if (_innControllers[index].text.isEmpty && !(docType != null && _docNumberControllers[index].text.isNotEmpty && _docSeriesControllers[index].text.isNotEmpty)) {
      return 'Введите значение';
    }
    return null;
  }

  String _birthDateValidator(DateTime value) {
    final now = DateTime.now();
    final checkDate = DateTime(now.year - 14, now.month, now.day);
    if (value == null) {
      return 'Введите значение';
    } else if (value.compareTo(checkDate) > 0) {
      return 'Дата рождения не может быть больше ${DateFormat('dd.MM.yyyy').format(checkDate)}';
    }
    return null;
  }

   String _registerDateValidator(DateTime value) {
    if (value == null) {
      return 'Введите значение';
    } else if (value.compareTo(DateTime.now()) > 0) {
      return 'Дата регистрации не может быть больше текущей даты';
    }
    return null;
  }

  String _emptyConditionValidator(String value, TextEditingController controller) {
    if (value.isEmpty && controller.text.isEmpty) {
      return 'Введите значение';
    }
    return null;
  }

  bool get _validKind {
    try {
      return widget.report.violation(widget.violationIndex).violationKind.id == 19;
    } catch (ex) {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> TotalReportBloc(TotalReportBlocState(widget.report, null, null))..add(LoadEvent(widget.violationIndex, widget.report)),
      child: BlocBuilder<TotalReportBloc, TotalReportBlocState>(
        builder: (context, state) {
          if (state is LoadDictState) {
            //_loadDict(context);
          } else if (state is UserLocationLoadedState) {
            _centerMapToLocation(context, state.userLocation);
          } else if (state is ViolationLocationLoadedState) {
            _centerMapToLocation(context, state.violationLocation);
          } else if (state is AddressFromLocationState) {
            _setViolationAddress(context, state.report.violation(widget.violationIndex), state.violationLocation);
          } else if (state is SuccessState) {
            _showSuccess(context, state.report);
            //_showSnackBar(context, 'Рапорт успешно сформирован');
            //_back();
          } else if (state is DeletedState) {
            _showSnackBar(context, 'Рапорт удален');
            _back();
          } else if (state is ErrorState) {
            _showSnackBar(context, 'Произошла ошибка. ${state.exception.message} ${state.exception.details}');
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ProjectAppbar('Рапорт ${widget.report.reportNum ?? ''}',),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    _buildError(context, state.report),
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

  Widget _buildAddressDialog(BuildContext context, int index, ViolatorAddress address) {
    return BlocProvider(
      create: (context)=> TotalReportDialogBloc(TotalReportDialogBlocState(address)),
      child: BlocBuilder<TotalReportDialogBloc, TotalReportDialogBlocState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Form(
                    key: _addressDialogKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Адрес',
                            style: ProjectTextStyles.title.apply(color: ProjectColors.blue)
                          )
                        ),
                        _buildTextField('Индекс', 'Введите данные', _addressDialogIndexController, validator: _emptyValidator),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: _buildAutocomplete(
                                'Субъект',
                                'Выберите значение',
                                _addressDialogAutoSubjectTypeController,
                                (value)=> _onAddressDialogSubjectTypeSearch(context, index, value),
                                (value)=> _onAddressDialogSubjectTypeSelect(context, value),
                                //formatter: (address)=> '${address.subjectType ?? ''} ${address.subjectName}',
                                //validator: _emptyValidator
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                            ),
                            Flexible(
                              child: _buildAutocomplete(
                                '',
                                'Введите значение',
                                _addressDialogAutoSubjectController,
                                (value)=> _onAddressDialogSubjectSearch(context, index, value),
                                (value)=> _onAddressDialogSelect(context, value),
                                formatter: (address)=> '${address.subjectType ?? ''} ${address.subjectName}',
                                //validator: _emptyValidator
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
                                'Район',
                                'Выберите значение',
                                _addressDialogAutoRegionTypeController,
                                (value)=> _onAddressDialogRegionTypeSearch(context, index, value),
                                (value)=> _onAddressDialogRegionTypeSelect(context, value),
                                //formatter: (address)=> '${address.regionType ?? ''} ${address.regionName}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                            ),
                            Flexible(
                              child: _buildAutocomplete(
                                '',
                                'Введите значение',
                                _addressDialogAutoRegionController,
                                (value)=> _onAddressDialogRegionSearch(context, index, value),
                                (value)=> _onAddressDialogSelect(context, value),
                                formatter: (address)=> '${address.regionType ?? ''} ${address.regionName}',
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
                                'Город',
                                'Выберите значение',
                                _addressDialogAutoCityTypeController,
                                (value)=> _onAddressDialogCityTypeSearch(context, index, value),
                                (value)=> _onAddressDialogCityTypeSelect(context, value),
                                //formatter: (address)=> '${address.cityType ?? ''} ${address.cityName}',
                                //validator: (value)=> _emptyConditionValidator(value, _addressDialogAutoPlaceController)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                            ),
                            Flexible(
                              child: _buildAutocomplete(
                                '',
                                'Выберите значение',
                                _addressDialogAutoCityController,
                                (value)=> _onAddressDialogCitySearch(context, index, value),
                                (value)=> _onAddressDialogSelect(context, value),
                                formatter: (address)=> '${address.cityType ?? ''} ${address.cityName}',
                                validator: (value)=> _emptyConditionValidator(value, _addressDialogAutoPlaceController)
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
                                'Населенный пункт',
                                'Выберите значение',
                                _addressDialogAutoPlaceTypeController,
                                (value)=> _onAddressDialogPlaceTypeSearch(context, index, value),
                                (value)=> _onAddressDialogPlaceTypeSelect(context, value),
                                // formatter: (address)=> '${address.placeType ?? ''} ${address.placeName}',
                                // validator:  (value)=> _emptyConditionValidator(value, _addressDialogAutoCityController)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                            ),
                            Flexible(
                              child: _buildAutocomplete(
                                '',
                                'Введите значение',
                                _addressDialogAutoPlaceController,
                                (value)=> _onAddressDialogSettlementSearch(context, index, value),
                                (value)=> _onAddressDialogSelect(context, value),
                                formatter: (address)=> '${address.placeType ?? ''} ${address.placeName}',
                                validator:  (value)=> _emptyConditionValidator(value, _addressDialogAutoCityController)
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
                                _addressDialogAutoStreetTypeController,
                                (value)=> _onAddressDialogStreetTypeSearch(context, index, value),
                                (value)=> _onAddressDialogStreetTypeSelect(context, value),
                                // formatter: (address)=> '${address.streetType ?? ''} ${address.streetName}',
                                // validator: _emptyValidator
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                            ),
                            Flexible(
                              child: _buildAutocomplete(
                                '',
                                'Введите значение',
                                _addressDialogAutoStreetController,
                                (value)=> _onAddressDialogStreetSearch(context, index, value),
                                (value)=> _onAddressDialogSelect(context, value),
                                formatter: (address)=> '${address.streetType ?? ''} ${address.streetName}',
                                validator: _emptyValidator
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: _buildTextField('Дом, владение', 'Введите данные', _addressDialogHouseController, validator: _emptyValidator),
                            ),
                            Padding(padding: const EdgeInsets.only(left: 35)),
                            Flexible(
                              child: _buildTextField('Корпус', 'Введите данные', _addressDialogBuildingController),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: _buildTextField('Строение', 'Введите данные', _addressDialogBuildingExtController),
                            ),
                            Padding(padding: const EdgeInsets.only(left: 35)),
                            Flexible(
                              child: _buildTextField('Квартира/Офис', 'Введите данные', _addressDialogFlatController),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ProjectButton.buildOutlineButton('Отмена',
                                onPressed: ()=> Navigator.pop(context)
                              ),
                              Padding(padding: const EdgeInsets.only(left: 20)),
                              ProjectButton.builtFlatButton('Сохранить',
                                onPressed: ()=> _onAddressDialogClose(context, state.address)
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          );
        }
      )
    );
  }

  Widget _buildError(BuildContext context, Report report) {
    if (report.error != null && report.error.isNotEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        child: Text('Рапорт № ${report.reportNum} от ${DateFormat('dd.MM.yyyy').format(report.reportDate)} не был загружен в ЕИС ОАТИ. Ошибка: ${report.error}',
          style: ProjectTextStyles.baseBold.apply(
            color: ProjectColors.red,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ProjectColors.red,
            width: 2,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildViolationNotPresent(BuildContext context, TotalReportBlocState state) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImagePicker(
            images: _photos,
            names: _photoNames,
            enabled: widget.report.isUpdatable && _validKind,
            onRotated: (index, image)=> _onPhotoRotate(context, index, image),
            onPicked: (file) => _onPhotoPick(context, file),
            onRemoved: (index)=> _onPhotoRemove(context, index),
          ),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(int index, Function onTap) {
    if (index > 0) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
          child: Text('Удалить',
            style: ProjectTextStyles.base.apply(color: ProjectColors.red),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildViolationPresent(BuildContext context, TotalReportBlocState state) {
    return Column(
      children: [
        _buildMap(context, state),
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
                      _addressByLocation,
                      (value)=> _onAddressByLocation(context, value),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildCheckBox(
                      'ТиНАО',
                      _tinao,
                      (value)=> _onTinao(context, value)
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
                      validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.violationAddress?.area)
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
                      validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.violationAddress?.district)
                    ),
                  ),
                ],
              ),
              !_tinao ? Row(
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
                      validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.violationAddress?.street)
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
                      validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.violationAddress?.houseNum),
                    ),
                  ),
                ],
              ) : const SizedBox(),
              _buildTextField(
                'Адресный ориентир',
                'Введите данные',
                _specifiedAddressController,
                validator: (value) => _tinao ? _emptyValidator(value) : null
              ),
              _buildTitle('Нарушение'),
              _buildAutocomplete(
                'Код объекта контроля',
                'Выберите значение',
                _objectCategoryController,
                (value)=> _onObjectCategoriesSearch(context, value),
                (value)=> _onObjectCategorySelect(context, value),
                validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.objectCategory),
              ),
              _buildTextField('Описание нарушения', 'Введите данные', _violationDescriptionController,
                validator: _emptyValidator
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: List.generate(state.report.violation(widget.violationIndex)?.normativeActArticles?.length ?? 1,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildAutocomplete(
                              'Нормативно-правовой акт',
                              'Выберите значение',
                              _normativeActControllers[index],
                              (value)=> _onNormativeActSearch(context, value),
                              (value)=> _onNormativeActSelect(context, index, value),
                              validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.normativeActArticles[index].normativeActId),
                              padding: const EdgeInsets.only(right: 30)
                            ),
                            _buildAutocomplete(
                              'Пункт',
                              'Выберите значение',
                              _normativeActArticleControllers[index],
                              (value)=> _onNormativeActArticleSearch(context, index, value),
                              (value)=> _onNormativeActArticleSelect(context, index, value),
                              validator: (value) => _nullValidator(state.report?.violation(widget.violationIndex)?.normativeActArticles[index].id),
                              padding: const EdgeInsets.only(top: 20, right: 30)
                            ),
                            _buildDeleteButton(index, ()=> _onNormativeActDelete(context, index))
                          ],
                        ),
                      ),
                    ),
                  ),
                  _buildConnector(context, state.report.violation(widget.violationIndex)?.normativeActArticles?.length ?? 1),
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
                      validator: (value)=> _nullValidator(state.report?.violation(widget.violationIndex)?.violationType)
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildTextField('Статья КоАП', 'Введите данные', _codexArticleController,
                      //validator: _emptyValidator,
                      enabled: false
                    ),
                  ),
                ],
              ),
              _buildTitle('Фотоматериалы нарушения'),
              ImagePicker(
                images: _photos,
                names: _photoNames,
                enabled: widget.report.isUpdatable && _validKind,
                onRotated: (index, image)=> _onPhotoRotate(context, index, image),
                onPicked: (file)=> _onPhotoPick(context, file),
                onRemoved: (index)=> _onPhotoRemove(context, index)
              ),
            ],
          ),
        ),
        _buildTitle('Нарушители'),
        Column(
          children: List.generate(state.report.violation(widget.violationIndex)?.violators?.length ?? 1,
            (index) {
              final violator = state.report.violation(widget.violationIndex)?.violators?.elementAt(index);
              ViolatorResolution resolution;
              if(violator != null && state.reportStatusInfo != null) {
                resolution = state.reportStatusInfo.violators.firstWhere((violatorResolution) => violator.id == violatorResolution.violatorId);
              }
              return _buildViolator(context, violator ?? Violator.empty(), index, resolution: resolution);
            },
          ),
        ),
        _buildAddViolator(context),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildViolator(BuildContext context, Violator violator, int index, {ViolatorResolution resolution}) {
    print(violator.toJson());
    return Theme(
     data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: EdgeInsets.zero,
        title: Text('Нарушитель ${index + 1}',
          style: ProjectTextStyles.base
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Column(
              children: [
                _buildAutocomplete('Тип нарушителя', 'Выберите значение',
                  _violatorTypeControllers[index],
                  (value)=> _onViolatorTypeSearch(context, value),
                  (value)=> _onViolatorTypeSelect(context, index, value),
                  validator: (value) => _nullValidator(violator?.type)
                ),
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
                      _buildAutocomplete('Нарушитель', 'Выберите значение',
                        _violatorControllers[index],
                        (value)=> _onViolatorSearch(context, index, value),
                        (value)=> _onViolatorSelect(context, index, value),
                      ),
                      _buildViolatorInfo(context, index, violator, resolution: resolution)
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: _buildDeleteButton(index, ()=> _onViolatorDelete(context, index)),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViolatorInfo(BuildContext context, int index, Violator violator, {ViolatorResolution resolution}) {
    return Column(
      children: [
        if (violator?.type?.id == ViolatorTypeIds.official)
          _buildOfficial(context, index, violator)
        else if (violator?.type?.id == ViolatorTypeIds.private)
          _buildPrivate(context, index, violator)
        else if (violator?.type?.id == ViolatorTypeIds.ip)
          _buildIp(context, index, violator)
        else
          _buildLegal(context, index, violator),
        if(resolution != null)
          ResolutionWidget(resolution: resolution),
      ],
    );
  }

  Widget _buildLegal(BuildContext context, int index, Violator violator) {
    final person = violator?.violatorPerson as ViolatorInfoLegal;
    final enabled = true;//person?.id == null;
    final textValidator = enabled ? _emptyValidator : null;
    print(violator.foreign);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРН', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: (value) => violator.foreign ? null : _emptyValidator(value), inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('КПП', 'Введите данные', _kppControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,),
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
                  enabled: widget.report.isUpdatable && enabled && _validKind,
                  values: _registerDates[index] != null ? [_registerDates[index]] : null,
                  onChanged: (date) => _onRegisterDateSelect(context, index, date),
                  validator: enabled ? (value) => _registerDateValidator(_registerDates[index]) : null
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
                enabled: true,
                //validator: enabled ? (value) => _nullValidator(violator?.departmentCode) : null
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, inputType: TextInputType.phone,),
            ),
          ],
        ),
        InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.legalAddress, _onLegalAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Юридический адрес', 'Введите данные', _legalAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
        InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.postalAddress, _onPostalAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Фактический адрес', 'Введите данные', _postalAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
      ],
    );
  }

  Widget _buildOfficial(BuildContext context, int index, Violator violator) {
    final person = violator?.violatorPerson as ViolatorInfoOfficial;
    final enabled = true; //person?.id == null;
    final textValidator = enabled ? _emptyValidator : null;
    return Column(
      children: [
        _buildTextField('Фамилия', 'Введите данные', _lastNameControllers[index], enabled: enabled, validator:  textValidator),
        _buildTextField('Имя', 'Введите данные', _firstNameControllers[index], enabled: enabled, validator: textValidator),
        _buildTextField('Отчество', 'Введите данные', _patronymControllers[index], enabled: enabled, validator: textValidator),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildTextField('ИНН организации', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРН организации', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: (value) => violator.foreign ? null : _emptyValidator(value), inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('КПП организации', 'Введите данные', _kppControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,)
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
                  enabled: widget.report.isUpdatable && enabled && _validKind,
                  values: _registerDates[index] != null ? [_registerDates[index] ] : null,
                  onChanged: (date) => _onRegisterDateSelect(context, index, date),
                  validator: enabled ? (value) => _registerDateValidator(_registerDates[index]) : null
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
              child: _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, inputType: TextInputType.phone,),
            ),
          ],
        ),
        InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.orgLegalAddress, _onLegalAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Юридический адрес', 'Введите данные', _legalAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
        InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.orgPostalAddress, _onPostalAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Фактический адрес', 'Введите данные', _postalAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
      ],
    );
  }

  Widget _buildPrivate(BuildContext context, int index, Violator violator) {
    final enabled = true; //violator?.violatorPerson?.id == null;
    final person = violator.violatorPerson as ViolatorInfoPrivate;
    final textValidator = enabled ? _emptyValidator : null;
    final emptyInn = _innControllers[index].text.isEmpty;
    return Column(
      children: [
        _buildTextField('Фамилия', 'Введите данные', _lastNameControllers[index], enabled: enabled, validator:  textValidator),
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
                validator: enabled && emptyInn ? (value) => _nullValidator(person?.docType) : null,
                enabled: enabled,
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('Серия документа', 'Введите данные', _docSeriesControllers[index], enabled: enabled, validator: (value)=> emptyInn && enabled ? _emptyValidator(value) : null),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('Номер документа', 'Введите данные', _docNumberControllers[index], enabled: enabled, validator: (value)=> emptyInn && enabled ? _emptyValidator(value) : null),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: (value)=> enabled ? _innValidator(index, person?.docType) : null, inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('СНИЛС', 'Введите данные', _snilsControllers[index], enabled: enabled),
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
                  enabled: widget.report.isUpdatable && enabled && _validKind,
                  values: _birthDates[index] != null ? [_birthDates[index]] : null,
                  onChanged: (date) => _onBirthDateSelect(context, index, date),
                  validator: enabled ? (value) => _birthDateValidator(_birthDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child :_buildTextField('Место рождения', 'Введите данные', _birthPlaceControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
        InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.registrationAddress, _onRegistrationAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Адрес регистрации', 'Введите данные', _registrationAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
        _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, inputType: TextInputType.phone,),
      ],
    );
  }

  Widget _buildIp(BuildContext context, int index, Violator violator) {
    final person = violator.violatorPerson as ViolatorInfoIp;
    final enabled = true; //person?.id == null;
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
              child: _buildTextField('ИНН', 'Введите данные', _innControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('ОГРНИП', 'Введите данные', _ogrnControllers[index], enabled: enabled, validator: textValidator, inputType: TextInputType.number,),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child: _buildTextField('СНИЛС', 'Введите данные', _snilsControllers[index], enabled: enabled),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ProjectDatePicker(
            title: 'Дата регистрации',
            hintText: 'Выберите дату',
            singleDate: true,
            enabled: widget.report.isUpdatable && enabled && _validKind,
            values: _registerDates[index] != null ? [_registerDates[index] ] : null,
            onChanged: (date) => _onRegisterDateSelect(context, index, date),
            validator: enabled ? (value) => _registerDateValidator(_registerDates[index]) : null
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
                  enabled: widget.report.isUpdatable && enabled && _validKind,
                  values: _birthDates[index] != null ? [_birthDates[index] ] : null,
                  onChanged: (date) => _onBirthDateSelect(context, index, date),
                  validator: enabled ? (value) => _birthDateValidator(_birthDates[index]) : null
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 20)),
            Flexible(
              child :_buildTextField('Место рождения', 'Введите данные', _birthPlaceControllers[index], enabled: enabled, validator: textValidator),
            ),
          ],
        ),
         InkWell(
          onTap: ()=> enabled ? _onAddressDialog(context, index, person?.registrationAddress, _onRegistrationAddressSelect) : null,
          child: IgnorePointer(
            child: _buildTextField('Адрес регистрации', 'Введите данные', _registrationAddressControllers[index], enabled: enabled, validator: textValidator),
          ),
        ),
        _buildTextField('Телефон', 'Введите данные', _phoneControllers[index], enabled: enabled, inputType: TextInputType.phone,),
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.center,
        children: [
          ProjectButton.builtFlatButton('Сохранить проект',
            onPressed: report.isNew && _validKind ? () => _onSave(context, ReportStatusIds.project) : null,
          ),
          ProjectButton.builtFlatButton('Сохранить',
            onPressed: report.isNew && _validKind ? ()=> _onSave(context, ReportStatusIds.new_) : null,
          ),
          ProjectButton.builtFlatButton('На согласование',
            onPressed: report.isUpdatable && _validKind ? ()=>_onSave(context, ReportStatusIds.onApproval) : null,
          ),
          ProjectButton.builtFlatButton('Удалить',
            color: ProjectColors.red,
            disabledColor: ProjectColors.red.withOpacity(0.3),
            onPressed: report.isDeletable && _validKind ? ()=> _onDeleteReport(context) : null
          ),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context, TotalReportBlocState state) {
    final markers = <Marker>[];
    if (state.userLocation != null) {
      markers.add(
        Marker(
          point: state.userLocation,
          builder: (context) => Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ProjectColors.lightBlue
            ),
          ),
        ),
      );
    }
    if (state.violationLocation != null) {
      markers.add(
        Marker(
          point: state.violationLocation,
          builder: (context) => Icon(
            Icons.error_outline,
            size: 40,
            color: ProjectColors.red,
          )
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
              zoom: 14,
              onTap: (value)=> _onMapTap(context, value)
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']
                // tileProvider: AssetTileProvider(),
                // urlTemplate: "assets/map_tiles/{z}/{x}/{y}.png",
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
                  _buildPinButton(context, Icons.add, ProjectColors.green, _onMapEdit, pinColor: _markEditing ? ProjectColors.darkBlue.withOpacity(0.5) : ProjectColors.darkBlue),
                  _buildPinButton(context, Icons.close, ProjectColors.red, _onMapClear),
                  _buildPinButton(context, Icons.play_arrow, ProjectColors.cyan, _onMapCenter)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinButton(BuildContext context, IconData icon, Color color, Function(BuildContext) onTap, {Color pinColor =  ProjectColors.darkBlue}) {
    return InkWell(
      onTap: ()=> onTap(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(Icons.location_on,
                color: pinColor,
                size: 22,
              ),
            ),
            Icon(icon,
              size: 12,
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnector(BuildContext context, int count) {
    final border = BorderSide(color: ProjectColors.lightBlue);
    final deleteOffset = 92 - max(0, (count - 2) * 25);
    return Stack(
      children: [
        Container(
          width: 20,
          height: count * 92 * 2.0 - deleteOffset,
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
            onChanged: widget.report.isUpdatable && enabled && _validKind ? onChanged : (v){},
          ),
          Flexible(
            child: Padding(
            padding: const EdgeInsets.only(left: 10),
              child: Text(title,
                style: (style ?? ProjectTextStyles.base).apply(color: ProjectColors.black),
              ),
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
      bool enabled = true,
      TextInputType inputType,
    }
  ) {
    return Padding(
      padding: padding,
      child: ProjectTextField(
        title: title,
        hintText: hintText,
        controller: controller,
        validator: validator,
        enabled: widget.report.isUpdatable && enabled && _validKind,
        inputType: inputType,
      )
    );
  }

  Widget _buildAutocomplete(
    String title,
    String hintText,
    TextEditingController controller,
    AutocompleteCallback suggestionsCallback,
    Function(dynamic) onSuggestionSelected, {
      Function(dynamic) formatter,
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
        formatter: formatter,
        enabled: widget.report.isUpdatable && enabled && _validKind,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return ProjectTitle(title);
  }
}
