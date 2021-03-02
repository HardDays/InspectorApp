import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/request.dart';

class DepartmentControlLocalSqliteServiceClient with DepartmentControlLocalService, DepartmentControlServiceClient {
  @override
  Future<void> extendPeriod(DepartmentControlExtendControlPeriodRequest request) {
    // TODO: implement extendPeriod
    throw UnimplementedError();
  }

  @override
  Future<ControlObject> getControlObjectById(int dcObjectId) {
    // TODO: implement getControlObjectById
    throw UnimplementedError();
  }

  @override
  Future<List<ControlObject>> getControlObjects(DepartmentControlObjectsRequest request) {
    // TODO: implement getControlObjects
    throw UnimplementedError();
  }

  @override
  Future<ControlResultSearchResult> getControlSearchResultByIds(DepartmentControlSearchResultByIdsRequest request) {
    // TODO: implement getControlSearchResultByIds
    throw UnimplementedError();
  }

  @override
  Future<List<ControlResultSearchResult>> getControlSearchResults(DepartmentControlSearchResultsRequest request) {
    // TODO: implement getControlSearchResults
    throw UnimplementedError();
  }

  @override
  Future<ControlResult> registerControlResult(DepartmentControlRegisterControlRequest request) {
    // TODO: implement registerControlResult
    throw UnimplementedError();
  }

  @override
  Future<PerformControl> registerPerformControl(DepartmentControlRegisterPerformControlRequest request) {
    // TODO: implement registerPerformControl
    throw UnimplementedError();
  }

  @override
  // TODO: implement registerRequests
  Future<Iterable<DepartmentControlRegisterControlRequest>> get registerRequests => throw UnimplementedError();

  @override
  Future<void> removeControlResult(DepartmentControlRemoveControlRequest request) {
    // TODO: implement removeControlResult
    throw UnimplementedError();
  }

  @override
  Future<void> removePerformControl(DepartmentControlRemovePerformControlRequest request) {
    // TODO: implement removePerformControl
    throw UnimplementedError();
  }

  @override
  Future<ControlResult> updateControlResult(DepartmentControlUpdateControlRequest request) {
    // TODO: implement updateControlResult
    throw UnimplementedError();
  }

  @override
  Future<PerformControl> updatePerformControl(DepartmentControlUpdatePerformControlRequest request) {
    // TODO: implement updatePerformControl
    throw UnimplementedError();
  }

}