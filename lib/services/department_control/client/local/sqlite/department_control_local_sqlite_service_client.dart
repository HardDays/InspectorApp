import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';

class _ControlObjectsSql {

  static const TABLE_NAME = 'ControlObjects';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      externalId INTEGER,
      typeId INTEGER,
      kind TEXT,
      name TEXT,
      area TEXT,
      district TEXT,
      address TEXT,
      balanceOwner TEXT,
      defaultContractorId INTEGER,
      cameraCount INTEGER,
      violationCount INTEGER,
      lastSurveyDate INTEGER,
      rowColor TEXT
    );
  ''';

  static const SELECT_QUERY = '''
    SELECT * FROM $TABLE_NAME INNER JOIN ${_ControlObjectsSql.TABLE_NAME} ON $TABLE_NAME.typeId = ${_ControlObjectsSql.TABLE_NAME}.id;
  ''';

  static const INSERT_QUERY = '''
    INSERT INTO $TABLE_NAME(
      id, 
      externalId, 
      typeId, 
      kind, 
      name, 
      area, 
      district, 
      address, 
      balanceOwner, 
      defaultContractorId, 
      cameraCount, 
      violationCount, 
      lastSurveyDate, 
      rowColor
    ) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
  ''';
}

class _ObjectTypesSql {

  static const TABLE_NAME = 'ObjectTypes';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      name TEXT,
      code TEXT
    );
  ''';

  static const INSERT_QUERY = '''
    INSERT OR IGNORE INTO $TABLE_NAME (id, name, code) VALUES (?, ?, ?);
  ''';

}

class _ContractorsSql {

  static const TABLE_NAME = 'Contractors';

  static const INSERT_QUERY = '''
    INSERT OR IGNORE INTO $TABLE_NAME (id, name, code) VALUES (?, ?, ?);
  ''';

}

class DepartmentControlLocalSqliteServiceClient extends DepartmentControlLocalService {
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

  @override
  Future<void> saveObjects(Iterable<ControlObject> objects) {
    // TODO: implement saveObjects
    throw UnimplementedError();
  }

  @override
  // TODO: implement metadata
  Future<DepartmentControlLocalServiceMetadata> get metadata => throw UnimplementedError();

}