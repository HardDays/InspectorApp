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

  Future<List<T>> _loadDictionary<T>(Converter<T> converter) async {
    final data = await api.getDictionary<T>();
    try {
      return List<T>.from(data['data'].map((x) => converter(x)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

  Future<List<SpecialObject>> getSpecialObjects() =>
      _loadDictionary((d) => SpecialObject.fromJson(d));

  Future<List<ObjectCategory>> getObjectCategories() =>
      _loadDictionary((d) => ObjectCategory.fromJson(d));
  
  Future<List<CheckStatus>> getCheckStatuses() =>
      _loadDictionary((d) => CheckStatus.fromJson(d));

  Future<List<Address>> getAddresses() =>
      _loadDictionary((d) => Address.fromJson(d));

  Future<List<CheckType>> getCheckTypes() =>
      _loadDictionary((d) => CheckType.fromJson(d));

  Future<List<NormativeAct>> getNormativeActs() =>
      _loadDictionary((d) => NormativeAct.fromJson(d));

  Future<List<ViolationKind>> getViolationKinds() =>
      _loadDictionary((d) => ViolationKind.fromJson(d)); 

  Future<List<ViolationType>> getViolationTypes() =>
      _loadDictionary((d) => ViolationType.fromJson(d)); 

  Future<List<Employee>> getEmployees() =>
      _loadDictionary((d) => Employee.fromJson(d)); 

  Future<List<ReportStatus>> getReportStatuses() =>
      _loadDictionary((d) => ReportStatus.fromJson(d)); 

  Future<List<ViolatorType>> getViolatorTypes() =>
      _loadDictionary((d) => ViolatorType.fromJson(d));

  Future<List<InstructionStatus>> getInstructionStatuses() =>
      _loadDictionary((d) => InstructionStatus.fromJson(d));

  Future<List<ViolationStatus>> getViolationStatuses() =>
      _loadDictionary((d) => ViolationStatus.fromJson(d));
  
  Future<List<OatiDepartment>> getOatiDepartments() =>
      _loadDictionary((d) => OatiDepartment.fromJson(d));
  
  Future<List<DepartmentCode>> getDepartmentCodes() =>
      _loadDictionary((d) => DepartmentCode.fromJson(d));

  Future<List<ViolatorDocumentType>> getViolatorDocumentTypes() =>
      _loadDictionary((d) => ViolatorDocumentType.fromJson(d));  
  
}
