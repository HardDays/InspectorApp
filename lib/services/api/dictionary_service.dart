import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/employee.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/kladdr_address_object_type.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/resolution_type.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';

typedef T Converter<T>(dynamic);

class ApiDictionaryService {
  final api = ApiProvider();

  static final _instance = ApiDictionaryService._internal();

  factory ApiDictionaryService() {
    return _instance;
  }

  ApiDictionaryService._internal();

  Future<List<T>> _loadDictionary<T>(Converter<T> converter, int from, int to) async {
    final data = await api.getDictionary<T>(from, to);
    try {
      return List<T>.from(
        data['data']
          .where((value) => value != null)
          .map((x) => converter(x))
      );
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

  Future<List<SpecialObject>> getSpecialObjects(int from, int to) =>
      _loadDictionary<SpecialObject>((d) => SpecialObject.fromJson(d), from, to);

  Future<List<ObjectCategory>> getObjectCategories(int from, int to) =>
      _loadDictionary<ObjectCategory>((d) => ObjectCategory.fromJson(d), from, to);
  
  Future<List<CheckStatus>> getCheckStatuses(int from, int to) =>
      _loadDictionary<CheckStatus>((d) => CheckStatus.fromJson(d), from, to);

  Future<List<Address>> getAddresses(int from, int to) =>
      _loadDictionary<Address>((d) => Address.fromJson(d), from, to);

  Future<List<CheckType>> getCheckTypes(int from, int to) =>
      _loadDictionary<CheckType>((d) => CheckType.fromJson(d), from, to);

  Future<List<NormativeAct>> getNormativeActs(int from, int to) =>
      _loadDictionary<NormativeAct>((d) => NormativeAct.fromJson(d), from, to);

  Future<List<ViolationKind>> getViolationKinds(int from, int to) =>
      _loadDictionary<ViolationKind>((d) => ViolationKind.fromJson(d), from, to); 

  Future<List<ViolationType>> getViolationTypes(int from, int to) =>
      _loadDictionary<ViolationType>((d) => ViolationType.fromJson(d), from, to); 

  Future<List<Employee>> getEmployees(int from, int to) =>
      _loadDictionary<Employee>((d) => Employee.fromJson(d), from, to); 

  Future<List<ReportStatus>> getReportStatuses(int from, int to) =>
      _loadDictionary<ReportStatus>((d) => ReportStatus.fromJson(d), from, to); 

  Future<List<ViolatorType>> getViolatorTypes(int from, int to) =>
      _loadDictionary<ViolatorType>((d) => ViolatorType.fromJson(d), from, to);

  Future<List<InstructionStatus>> getInstructionStatuses(int from, int to) =>
      _loadDictionary<InstructionStatus>((d) => InstructionStatus.fromJson(d), from, to);

  Future<List<ViolationStatus>> getViolationStatuses(int from, int to) =>
      _loadDictionary<ViolationStatus>((d) => ViolationStatus.fromJson(d), from, to);
  
  Future<List<OatiDepartment>> getOatiDepartments(int from, int to) =>
      _loadDictionary<OatiDepartment>((d) => OatiDepartment.fromJson(d), from, to);
  
  Future<List<DepartmentCode>> getDepartmentCodes(int from, int to) =>
      _loadDictionary<DepartmentCode>((d) => DepartmentCode.fromJson(d), from, to);

  Future<List<ViolatorDocumentType>> getViolatorDocumentTypes(int from, int to) =>
      _loadDictionary<ViolatorDocumentType>((d) => ViolatorDocumentType.fromJson(d), from, to);  
  
  Future<List<ViolatorInfoOfficial>> getViolatorInfoOfficial(int from, int to) =>
      _loadDictionary<ViolatorInfoOfficial>((d) => ViolatorInfoOfficial.fromJson(d), from, to);  
  
  Future<List<ViolatorInfoLegal>> getViolatorInfoLegal(int from, int to) =>
      _loadDictionary<ViolatorInfoLegal>((d) => ViolatorInfoLegal.fromJson(d), from, to);  

  Future<List<ViolatorInfoPrivate>> getViolatorInfoPrivate(int from, int to) =>
      _loadDictionary<ViolatorInfoPrivate>((d) => ViolatorInfoPrivate.fromJson(d), from, to);  

  Future<List<ViolatorInfoIp>> getViolatorInfoIp(int from, int to) =>
      _loadDictionary<ViolatorInfoIp>((d) => ViolatorInfoIp.fromJson(d), from, to); 
  
  Future<List<ResolutionType>> getResolutionTypes(int from, int to) =>
      _loadDictionary<ResolutionType>((d) => ResolutionType.fromJson(d), from, to); 
 
  Future<List<NormativeActArticle>> getNormativeActArticles(int from, int to) =>
      _loadDictionary<NormativeActArticle>((d) => NormativeActArticle.fromJson(d), from, to); 

  Future<List<Area>> getAreas(int from, int to) =>
      _loadDictionary<Area>((d) => Area.fromJson(d), from, to); 
  
  Future<List<District>> getDistricts(int from, int to) =>
      _loadDictionary<District>((d) => District.fromJson(d), from, to); 

  Future<List<Street>> getStreets(int from, int to) =>
      _loadDictionary<Street>((d) => Street.fromJson(d), from, to);

  Future<List<ControlObject>> getControlObjects(int from, int to) =>
      _loadDictionary<ControlObject>((d) => ControlObject.fromJson(d), from, to);
  
   Future<List<KladdrAddressObjectType>> getKladdrAddressTypes(int from, int to) =>
      _loadDictionary<KladdrAddressObjectType>((d) => KladdrAddressObjectType.fromJson(d), from, to);
}
