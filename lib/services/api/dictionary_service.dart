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
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';

typedef T Converter<T>(dynamic);

class DictionaryService {
  final api = ApiProvider();

  Future<List<T>> _loadDictionary<T>(Converter<T> converter) async {
    final data = await api.getDictionary<T>();
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

  Future<List<SpecialObject>> getSpecialObjects() =>
      _loadDictionary<SpecialObject>((d) => SpecialObject.fromJson(d));

  Future<List<ObjectCategory>> getObjectCategories() =>
      _loadDictionary<ObjectCategory>((d) => ObjectCategory.fromJson(d));
  
  Future<List<CheckStatus>> getCheckStatuses() =>
      _loadDictionary<CheckStatus>((d) => CheckStatus.fromJson(d));

  Future<List<Address>> getAddresses() =>
      _loadDictionary<Address>((d) => Address.fromJson(d));

  Future<List<CheckType>> getCheckTypes() =>
      _loadDictionary<CheckType>((d) => CheckType.fromJson(d));

  Future<List<NormativeAct>> getNormativeActs() =>
      _loadDictionary<NormativeAct>((d) => NormativeAct.fromJson(d));

  Future<List<ViolationKind>> getViolationKinds() =>
      _loadDictionary<ViolationKind>((d) => ViolationKind.fromJson(d)); 

  Future<List<ViolationType>> getViolationTypes() =>
      _loadDictionary<ViolationType>((d) => ViolationType.fromJson(d)); 

  Future<List<Employee>> getEmployees() =>
      _loadDictionary<Employee>((d) => Employee.fromJson(d)); 

  Future<List<ReportStatus>> getReportStatuses() =>
      _loadDictionary<ReportStatus>((d) => ReportStatus.fromJson(d)); 

  Future<List<ViolatorType>> getViolatorTypes() =>
      _loadDictionary<ViolatorType>((d) => ViolatorType.fromJson(d));

  Future<List<InstructionStatus>> getInstructionStatuses() =>
      _loadDictionary<InstructionStatus>((d) => InstructionStatus.fromJson(d));

  Future<List<ViolationStatus>> getViolationStatuses() =>
      _loadDictionary<ViolationStatus>((d) => ViolationStatus.fromJson(d));
  
  Future<List<OatiDepartment>> getOatiDepartments() =>
      _loadDictionary<OatiDepartment>((d) => OatiDepartment.fromJson(d));
  
  Future<List<DepartmentCode>> getDepartmentCodes() =>
      _loadDictionary<DepartmentCode>((d) => DepartmentCode.fromJson(d));

  Future<List<ViolatorDocumentType>> getViolatorDocumentTypes() =>
      _loadDictionary<ViolatorDocumentType>((d) => ViolatorDocumentType.fromJson(d));  
  
  Future<List<ViolatorInfoOfficial>> getViolatorInfoOfficial() =>
      _loadDictionary<ViolatorInfoOfficial>((d) => ViolatorInfoOfficial.fromJson(d));  
  
  Future<List<ViolatorInfoLegal>> getViolatorInfoLegal() =>
      _loadDictionary<ViolatorInfoLegal>((d) => ViolatorInfoLegal.fromJson(d));  

  Future<List<ViolatorInfoPrivate>> getViolatorInfoPrivate() =>
      _loadDictionary<ViolatorInfoPrivate>((d) => ViolatorInfoPrivate.fromJson(d));  

  Future<List<ViolatorInfoIp>> getViolatorInfoIp() =>
      _loadDictionary<ViolatorInfoIp>((d) => ViolatorInfoIp.fromJson(d)); 
  
  Future<List<ResolutionType>> getResolutionTypes() =>
      _loadDictionary<ResolutionType>((d) => ResolutionType.fromJson(d)); 
 
  Future<List<NormativeActArticle>> getNormativeActArticles() =>
      _loadDictionary<NormativeActArticle>((d) => NormativeActArticle.fromJson(d)); 
 
}
