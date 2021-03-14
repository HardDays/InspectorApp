import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/object_type.dart';
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
import 'package:inspector/extensions.dart';

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
    SELECT 
      $TABLE_NAME.id, 
      $TABLE_NAME.name,
      $TABLE_NAME.address,
      $TABLE_NAME.area,
      $TABLE_NAME.balanceOwner,
      $TABLE_NAME.cameraCount,
      $TABLE_NAME.district,
      $TABLE_NAME.externalId,
      $TABLE_NAME.kind,
      $TABLE_NAME.lastSurveyDate,
      $TABLE_NAME.rowColor,
      $TABLE_NAME.violationsCount,
      ${_ObjectTypesSql.TABLE_NAME}.id AS typeId, 
      ${_ObjectTypesSql.TABLE_NAME}.name AS typeName, 
      ${_ObjectTypesSql.TABLE_NAME}.code AS typeCode,
      ${_ContractorsSql.TABLE_NAME}.id AS defaultContractorId,
      ${_ContractorsSql.TABLE_NAME}.name AS contractorName,
      ${_ContractorsSql.TABLE_NAME}.inn AS contractorInn,
      ABS(? - x) + ABS(? - y) AS distance
    FROM $TABLE_NAME 
    LEFT JOIN ${_ObjectTypesSql.TABLE_NAME} ON $TABLE_NAME.typeId = ${_ObjectTypesSql.TABLE_NAME}.id
    LEFT JOIN ${_ContractorsSql.TABLE_NAME} ON $TABLE_NAME.defaultContractorId = ${_ContractorsSql.TABLE_NAME}.id
    _where_
    _order_by_
    LIMIT ?
    OFFSET ?;
  ''';

  static const INSERT_QUERY = '''
    INSERT OR REPLACE INTO $TABLE_NAME(
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
    ) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
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
  String get name => 'dc_local_service_client.db';

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
      _db.then((db) =>  db.rawQuery(
            _ControlObjectsSql.SELECT_QUERY
                .replaceAll(
                  '_where_',
                  _generateWhereStatement(request),
                )
                .replaceAll(
                  '_order_by_',
                  _generateOrderByStatement(request),
                ).println(),
            [request.userPositionX, request.userPositionY, request.to, request.from].println()),
          )
          .then((x) => x.map((e) => _fromSql(e.println())).toList());

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
          object.lastSurveyDate?.millisecondsSinceEpoch,
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
        (db) => db
            .first(
              {
                'key': 'metadata',
              },
            )
            .then(
              (x) => DepartmentControlLocalServiceMetadata.fromJson(x['value']),
            )
            .then(
              (value) => value,
              onError: (error) => DepartmentControlLocalServiceMetadata(
                false,
              ),
            ),
      );

  @override
  Future<void> saveMetadata(DepartmentControlLocalServiceMetadata metadata) =>
      objectDb.then(
        (db) async {
          await db.remove({'key': 'metadata'});
          await db.insert(
            {
              'key': 'metadata',
              'value': metadata.toJson(),
            },
          );
        },
      );

  @override
  Future<bool> isLoaded() => metadata.then((x) => x.loaded);

  @override
  Future<void> setLoaded(bool value) => metadata
      .then((x) => x.copyWith(loaded: value))
      .then((m) => saveMetadata(m));

  ControlObject _fromSql(Map<String, dynamic> json) => ControlObject(
        id: json['id'],
        address: json['address'],
        area: json['area'],
        balanceOwner: json['balanceOwner'],
        cameraCount: json['cameraCount'],
        district: json['district'],
        externalId: json['externalId'],
        kind: json['kind'],
        lastSurveyDate: json['lastSurveyDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['lastSurveyDate'])
            : null,
        name: json['name'],
        rowColor: json['rowColor'],
        type: ObjectType(
          id: json['typeId'],
          name: json['typeName'],
          code: json['typeCode'],
        ),
        contractor: Contractor(
          id: json['defaultContractorId'],
          name: json['contractorName'],
          inn: json['contractorInn'],
        ),
        violationsCount: json['violationsCount'],
        geometry: [],
        violations: [],
      );

  String _generateWhereStatement(DepartmentControlObjectsRequest request) {
    List<String> params = <String>[
      if (request.camerasExist != null)
        request.camerasExist ? 'cameraCount > 0' : 'cameraCount = 0',
      if (request.userPositionX != null &&
          request.userPositionY != null &&
          request.searchRadius != null &&
          request.onlyNearObjects == true)
        '(distance < ${request.searchRadius / 11111} OR distance IS NULL)',
      if (request.dcObjectTypesIds != null)
        'typeId = ${request.dcObjectTypesIds}',
      if (request.dcObjectKind != null) 'kind = "${request.dcObjectKind}"',
      if (request.balanceOwner != null)
        'balanceOwner LIKE "${request.balanceOwner}%"',
      if(request.objectName != null)
        'name LIKE "${request.objectName}%"',
      if(request.externalId != null)
        'externalId = ${request.externalId}',
      if(request.daysFromLastSurvey != null && request.daysFromLastSurvey != 0)
        '${DateTime.now().millisecondsSinceEpoch} - lastSurveyDate >= ${request.daysFromLastSurvey * Duration.millisecondsPerDay}',
      if(request.lastSurveyDateFrom != null)
        '${request.lastSurveyDateFrom.millisecondsSinceEpoch} < lastSurveyDate',
      if(request.lastSurveyDateTo != null)
        '${request.lastSurveyDateTo.millisecondsSinceEpoch + Duration.millisecondsPerDay} > lastSurveyDate',
    ];
    return params.isNotEmpty ? 'WHERE ${params.join(" AND ")}' : '';
  }

  String _generateOrderByStatement(DepartmentControlObjectsRequest request) {
    final sortStrings = <String>[
      if(request.sort == 'type')
        'typeId ASC',
      if (['name', 'address', 'lastSurveyDate'].contains(request.sort))
        '${_ControlObjectsSql.TABLE_NAME}.${request.sort} ASC',
      if(request.userPositionX != null &&
          request.userPositionY != null &&
          request.searchRadius != null &&
          request.onlyNearObjects == true)
          'distance ASC',
    ];
    return sortStrings.isNotEmpty ? 'ORDER BY ${sortStrings.join(" , ")}' : '';
  }
}