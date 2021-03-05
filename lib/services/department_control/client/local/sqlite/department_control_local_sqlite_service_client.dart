import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:objectdb/objectdb.dart';
import 'package:sqflite/sqflite.dart';

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
      violationsCount INTEGER,
      lastSurveyDate INTEGER,
      rowColor TEXT,
      x REAL,
      y REAL
    );
  ''';

  static const SELECT_QUERY = '''
    SELECT * FROM $TABLE_NAME 
    INNER JOIN ${_ObjectTypesSql.TABLE_NAME} ON $TABLE_NAME.typeId = ${_ObjectTypesSql.TABLE_NAME}.id
    INNER JOIN ${_ContractorsSql.TABLE_NAME} ON $TABLE_NAME.defaultContractorId = ${_ContractorsSql.TABLE_NAME}.id
    LIMIT ?
    OFFSET ?;
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
      violationsCount, 
      lastSurveyDate, 
      rowColor,
      x,
      y
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

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME(
      id INTEGER PRIMARY KEY,
      name TEXT,
      inn TEXT
    );
  ''';

  static const INSERT_QUERY = '''
    INSERT OR IGNORE INTO $TABLE_NAME (id, name, inn) VALUES (?, ?, ?);
  ''';
}

class DepartmentControlLocalSqliteServiceClient extends ObjectDBService
    implements DepartmentControlLocalService {
  static const DATABASE_FILENAME = 'departmentControl.db';
  static const DATABASE_VERSION = 1;

  Database _database;

  Future<Database> get _db async {
    if (_database == null) {
      var databasesPath = await getDatabasesPath();
      String path = '$databasesPath/$DATABASE_FILENAME';
      _database = await openDatabase(
        path,
        version: DATABASE_VERSION,
        onCreate: createTables,
        onUpgrade: onUpgrade,
      );
    }
    return _database;
  }

  @override
  String get name => 'dc_local_service_cliend.db';

  Future<ObjectDB> get objectDb => init();

  Future<void> createTables(Database db, int version) async {
    switch (version) {
      default:
        await db.execute(_ControlObjectsSql.CREATE_TABLE_QUERY);
        await db.execute(_ObjectTypesSql.CREATE_TABLE_QUERY);
        await db.execute(_ContractorsSql.CREATE_TABLE_QUERY);
        break;
    }
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {}

  @override
  Future<void> extendPeriod(
      DepartmentControlExtendControlPeriodRequest request) {
    // TODO: implement extendPeriod
    throw UnimplementedError();
  }

  @override
  Future<ControlObject> getControlObjectById(int dcObjectId) {
    // TODO: implement getControlObjectById
    throw UnimplementedError();
  }

  @override
  Future<List<ControlObject>> getControlObjects(
    DepartmentControlObjectsRequest request,
  ) =>
      _db
          .then((db) => db.rawQuery(_ControlObjectsSql.SELECT_QUERY, [request.to, request.from]))
          .then((x) => x.map((e) => ControlObject.fromJson(e)).toList());

  @override
  Future<ControlResultSearchResult> getControlSearchResultByIds(
      DepartmentControlSearchResultByIdsRequest request) {
    // TODO: implement getControlSearchResultByIds
    throw UnimplementedError();
  }

  @override
  Future<List<ControlResultSearchResult>> getControlSearchResults(
      DepartmentControlSearchResultsRequest request) {
    // TODO: implement getControlSearchResults
    throw UnimplementedError();
  }

  @override
  Future<ControlResult> registerControlResult(
      DepartmentControlRegisterControlRequest request) {
    // TODO: implement registerControlResult
    throw UnimplementedError();
  }

  @override
  Future<PerformControl> registerPerformControl(
      DepartmentControlRegisterPerformControlRequest request) {
    // TODO: implement registerPerformControl
    throw UnimplementedError();
  }

  @override
  // TODO: implement registerRequests
  Future<Iterable<DepartmentControlRegisterControlRequest>>
      get registerRequests => throw UnimplementedError();

  @override
  Future<void> removeControlResult(
      DepartmentControlRemoveControlRequest request) {
    // TODO: implement removeControlResult
    throw UnimplementedError();
  }

  @override
  Future<void> removePerformControl(
      DepartmentControlRemovePerformControlRequest request) {
    // TODO: implement removePerformControl
    throw UnimplementedError();
  }

  @override
  Future<ControlResult> updateControlResult(
      DepartmentControlUpdateControlRequest request) {
    // TODO: implement updateControlResult
    throw UnimplementedError();
  }

  @override
  Future<PerformControl> updatePerformControl(
      DepartmentControlUpdatePerformControlRequest request) {
    // TODO: implement updatePerformControl
    throw UnimplementedError();
  }

  @override
  Future<void> saveObjects(Iterable<ControlObject> objects) async {
    final batch = (await _db).batch();
    objects.forEach((object) {
      if (object.type != null) {
        batch.rawInsert(
          _ObjectTypesSql.INSERT_QUERY,
          [
            object.type.id,
            object.type.name,
            object.type.code,
          ],
        );
      }
      if (object.contractor != null) {
        batch.rawInsert(
          _ContractorsSql.INSERT_QUERY,
          [
            object.contractor.id,
            object.contractor.name,
            object.contractor.inn,
          ],
        );
      }
      batch.rawInsert(
        _ControlObjectsSql.INSERT_QUERY,
        [
          object.id,
          object.externalId,
          object.type?.id,
          object.kind,
          object.name,
          object.area,
          object.district,
          object.address,
          object.balanceOwner,
          object.contractor?.id,
          object.cameraCount,
          object.violationsCount,
          object.lastSurveyDate,
          object.rowColor,
          object.geometry?.first?.points?.first?.x,
          object.geometry?.first?.points?.first?.y,
        ],
      );
    });
    await batch.commit();
  }

  @override
  Future<DepartmentControlLocalServiceMetadata> get metadata => objectDb.then(
        (db) => db.first(
          {
            'key': 'metadata',
          },
        ).then(
          (x) => DepartmentControlLocalServiceMetadata.fromJson(x['value']),
          onError: () => DepartmentControlLocalServiceMetadata(
            null,
            0,
            false,
          ),
        ),
      );

  @override
  Future<void> saveMetadata(DepartmentControlLocalServiceMetadata metadata) =>
      objectDb.then(
        (db) => db.insert(
          {
            'key': 'metadata',
            'value': metadata.toJson(),
          },
        ),
      );

  @override
  Future<bool> isLoaded() => metadata.then((x) => x.loaded);

  @override
  Future<void> setLoaded(bool value) => metadata
      .then((x) => x.copyWith(loaded: value))
      .then((m) => saveMetadata(m));
}
