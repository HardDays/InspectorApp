import 'dart:convert';

import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/employee.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';

typedef T Converter<T>(dynamic);

class DictionaryService {
  final api = ApiProvider();

  Future<List<T>> _loadDictionary<T>(Converter<T> converter, String url) async {
    final data = await api.getDictionary(url);
    try {
      return List<T>.from(data['data'].map((x) => converter(x)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

  Future<List<SpecialObject>> getSpecialObjects() =>
      _loadDictionary((d) => SpecialObject.fromJson(d), '/dict/special-objects');

  Future<List<ObjectCategory>> getObjectCategories() =>
      _loadDictionary((d) => ObjectCategory.fromJson(d), '/dict/object-categories');
  
  Future<List<CheckStatus>> getCheckStatuses() =>
      _loadDictionary((d) => CheckStatus.fromJson(d), '/dict/check-statuses');

  Future<List<Address>> getAddresses() =>
      _loadDictionary((d) => Address.fromJson(d), '/dict/addresses');

  Future<List<CheckType>> getCheckTypes() =>
      _loadDictionary((d) => CheckType.fromJson(d), '/dict/check-types');

  Future<List<NormativeAct>> getNormativeActs() =>
      _loadDictionary((d) => NormativeAct.fromJson(d), '/dict/normative-acts');

  Future<List<ViolationKind>> getViolationKinds() =>
      _loadDictionary((d) => ViolationKind.fromJson(d), '/dict/violation-kinds'); 

  Future<List<ViolationType>> getViolationTypes() =>
      _loadDictionary((d) => ViolationType.fromJson(d), '/dict/violation-types'); 

  Future<List<Employee>> getEmployees() =>
      _loadDictionary((d) => Employee.fromJson(d), '/dict/employees'); 

  Future<List<ReportStatus>> getReportStatuses() =>
      _loadDictionary((d) => ReportStatus.fromJson(d), '/dict/report-statuses'); 

  Future<List<ViolatorType>> getViolatorTypes() =>
      _loadDictionary((d) => ViolatorType.fromJson(d), '/dict/violator-types');

  Future<List<InstructionStatus>> getInstructionStatuses() =>
      _loadDictionary((d) => InstructionStatus.fromJson(d), '/dict/instruction-statuses');

  Future<List<ViolationStatus>> getViolationStatuses() =>
      _loadDictionary((d) => ViolationStatus.fromJson(d), '/dict/violation-statuses');
  
  Future<List<OatiDepartment>> getOatiDepartments() =>
      _loadDictionary((d) => OatiDepartment.fromJson(d), '/dict/oati-departments');
  
  Future<List<DepartmentCode>> getDepartmentCodes() =>
      _loadDictionary((d) => DepartmentCode.fromJson(d), '/dict/department-codes');

  Future<List<ViolatorDocumentType>> getViolatorDocumentTypes() =>
      _loadDictionary((d) => ViolatorDocumentType.fromJson(d), '/dict/violator-doc-types');  
  
}
