import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';

abstract class DepartmentControlLocalService with DepartmentControlServiceClient {
  Future<Iterable<DepartmentControlRegisterControlRequest>> get registerRequests;
  Future<Iterable<DepartmentControlRemoveControlRequest>> get removeRequests;
  Future<Iterable<DepartmentControlUpdateControlRequest>> get updateRequests;
  Future<void> removeLocalRequests();

  Future<void> saveObjects(Iterable<ControlObject> objects);
  Future<void> saveSearchResults(Iterable<ControlResultSearchResult> searchResults);
  Future<DepartmentControlLocalServiceMetadata> get metadata;
  Future<void> saveMetadata(DepartmentControlLocalServiceMetadata metadata);
  Future<bool> isLoaded();
  Future<void> setLoaded(bool value);
  Future<int> get violationsCount;
}