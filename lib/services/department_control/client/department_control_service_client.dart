import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/services/department_control/client/request.dart';

mixin DepartmentControlServiceClient {
  Future<ControlObject> getControlObjectById(int dcObjectId);
  Future<List<ControlObject>> getControlObjects(DepartmentControlObjectsRequest request);
  Future<List<ControlResultSearchResult>> getControlSearchResults(DepartmentControlSearchResultsRequest request);
  Future<ControlResultSearchResult> getControlSearchResultByIds(DepartmentControlSearchResultByIdsRequest request);
  Future<ControlResult> registerControlResult(DepartmentControlRegisterControlRequest request);
  Future<ControlResult> updateControlResult(DepartmentControlUpdateControlRequest request);
  Future<void> removeControlResult(DepartmentControlRemoveControlRequest request);
  Future<PerformControl> registerPerformControl(DepartmentControlRegisterPerformControlRequest request);
  Future<PerformControl> updatePerformControl(DepartmentControlUpdatePerformControlRequest request);
  Future<void> removePerformControl(DepartmentControlRemovePerformControlRequest request);
  Future<void> extendPeriod(DepartmentControlExtendControlPeriodRequest request);
}