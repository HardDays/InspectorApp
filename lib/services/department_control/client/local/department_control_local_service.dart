import 'package:inspector/services/department_control/client/request.dart';

mixin DepartmentControlLocalService {
  Future<Iterable<DepartmentControlRegisterControlRequest>> get registerRequests;
  
}