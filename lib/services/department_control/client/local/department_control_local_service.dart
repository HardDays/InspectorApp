import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';

abstract class DepartmentControlLocalService with DepartmentControlServiceClient {
  Future<Iterable<DepartmentControlRegisterControlRequest>> get registerRequests;
  Future<void> saveObjects(Iterable<ControlObject> objects);
  Future<DepartmentControlLocalServiceMetadata> get metadata;
  Future<void> saveMetadata(DepartmentControlLocalServiceMetadata metadata);
  Future<bool> isLoaded();
  Future<void> setLoaded(bool value);
}