import 'dart:convert';

import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';
import 'package:inspector/services/images/images_service.dart';
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
  Future<ControlObject> getControlObjectById(int dcObjectId) => _db
      .then(
        (db) => db.rawQuery(
          _ControlObjectsSql.SELECT_QUERY
              .replaceAll(
                '_where_',
                'id = ?',
              )
              .replaceAll(
                '_order_by_',
                '',
              ),
          [null, null, dcObjectId, 0, 1],
        ),
      )
      .then((results) => results.first)
      .then(_fromSql);

  @override
  Future<List<ControlObject>> getControlObjects(
    DepartmentControlObjectsRequest request,
  ) =>
      _db
          .then(
            (db) => db.rawQuery(
                _ControlObjectsSql.SELECT_QUERY
                    .replaceAll(
                      '_where_',
                      _generateWhereStatement(request),
                    )
                    .replaceAll(
                      '_order_by_',
                      _generateOrderByStatement(request),
                    ),
                [
                  request.userPositionX,
                  request.userPositionY,
                  request.to,
                  request.from,
                ]),
          )
          .then((x) => x.map((e) => _fromSql(e)).toList());

  @override
  Future<ControlResultSearchResult> getControlSearchResultByIds(
      DepartmentControlSearchResultByIdsRequest request)
        => objectDb
          .then(
            (db) async {
              return db.first(
              {
                'id': request.dcControlResultId,
                'type': 'registerControlRequest',
              },
            );
            },
          )
          .then(
            (value) {
              DepartmentControlRegisterControlRequest request;
              try { // TODO: lmao, no comments
                request = DepartmentControlRegisterControlRequest.fromJson(value['request']);
              } catch (ex) {
                request = DepartmentControlRegisterControlRequest(value['request']['object'], value['request']['controlResult']);
              }
              return request
                .copyWith
                .controlResult(id: value['id']);
            },
          )
          .then(_readDepartmentControlRegisterControlRequest)
          .then(_fromDepartmentControlRegisterControlRequest);

  @override
  Future<List<ControlResultSearchResult>> getControlSearchResults(
          DepartmentControlSearchResultsRequest request) =>
      registerRequests
          .then((value) =>
              value.where((element) => element.object.id == request.dcObjectId))
          .then(
            (value) => value
                .map(_fromDepartmentControlRegisterControlRequest)
                .toList(),
          );

  @override
  Future<ControlResult> registerControlResult(
      DepartmentControlRegisterControlRequest request) async {
    final id = await _nextControlResultId;
    await objectDb.then((db) async {
      db.insert({
        'id': id,
        'type': 'registerControlRequest',
        'request': (await _saveDepartmentControlRegisterControlRequest(request))
            .toJson(),
      });
    });
    return fromRegisterControlResultRequest(request, id);
  }

  @override
  Future<PerformControl> registerPerformControl(
      DepartmentControlRegisterPerformControlRequest request) {
    // TODO: implement registerPerformControl
    throw UnimplementedError();
  }

  Future<Iterable<DepartmentControlRegisterControlRequest>> get _registerRequests
    =>  objectDb
          .then(
            (db) async {
              //await db.remove({});
              return db.find(
              {
                'type': 'registerControlRequest',
              },
            );
            },
          )
          .then(
            (value) => value
                .map(
                  (e) {
                    DepartmentControlRegisterControlRequest request;
                    try { // TODO: lmao, no comments
                      request = DepartmentControlRegisterControlRequest.fromJson(e['request']);
                    } catch (ex) {
                      e.println();
                      request = DepartmentControlRegisterControlRequest(e['request']['object'], e['request']['controlResult']);
                    }
                    return request
                      .copyWith
                      .controlResult(id: e['id']);
                  },
                )
                .toList(),
          );

  Future<Iterable<DepartmentControlUpdateControlRequest>> get updateRequests
    => _updateRequests.then((value) => value
              .map((e) =>
                  _readDepartmentControlUpdateControlRequest(e))
              .toList())
              .then((value) => Future.wait(value));

  Future<Iterable<DepartmentControlUpdateControlRequest>> get _updateRequests
    =>  objectDb
          .then(
            (db) => db.find(
              {
                'type': 'updateControlRequest',
              },
            ),
          )
          .then(
            (value) => value
                .map(
                  (e) {
                    DepartmentControlUpdateControlRequest request;
                    try { // TODO: lmao, no comments
                      request = DepartmentControlUpdateControlRequest.fromJson(e['request']);
                    } catch (ex) {
                      request = DepartmentControlUpdateControlRequest(e['request']['object'], e['request']['dcControlResultId'], e['request']['violation']);
                    }
                    return request;
                  },
                )
                .toList(),
          );

  @override
  Future<Iterable<DepartmentControlRegisterControlRequest>>
      get registerRequests => _registerRequests
          .then((value) => value
              .map((e) =>
                  _readDepartmentControlRegisterControlRequest(e))
              .toList())
              .then((value) => Future.wait(value));

  @override
  Future<Iterable<DepartmentControlRemoveControlRequest>>
      get removeRequests => objectDb
          .then(
            (db) => db.find(
              {
                'type': 'removeControlRequest',
              },
            ),
          )
          .then(
            (value) => value
                .map(
                  (e) {
                    DepartmentControlRemoveControlRequest request;
                    try { // TODO: lmao, no comments
                      request = DepartmentControlRemoveControlRequest.fromJson(e['request']);
                    } catch (ex) {
                      request = DepartmentControlRemoveControlRequest(e['request']['object'], e['request']['resultId']);
                    }
                    return request;
                  },
                )
                .toList(),
          );

  @override
  Future<void> removeControlResult(
          DepartmentControlRemoveControlRequest request) =>
      objectDb.then((db) async {
        if (await db.first({
              'id': request.resultId,
              'type': 'registerControlRequest',
            }) !=
            null) {
          await db.remove({
            'id': request.resultId,
            'type': 'registerControlRequest',
          });
        } else {
          await db.insert({
            'id': await _nextControlResultId,
            'type': 'removeControlRequest',
            'request': request.toJson(),
          });
        }
      });

  @override
  Future<void> removePerformControl(
      DepartmentControlRemovePerformControlRequest request) {
    // TODO: implement removePerformControl
    throw UnimplementedError();
  }

  @override
  Future<ControlResult> updateControlResult(
      DepartmentControlUpdateControlRequest request) {
    objectDb.then((db) async {
      final saved = await db.first({
        'id': request.dcControlResultId,
        'type': 'registerControlRequest',
      });
      if (saved != null) {
        await db.update({
          'id': request.dcControlResultId,
          'type': 'registerControlRequest',
        }, {
          'id': request.dcControlResultId,
          'type': 'registerControlRequest',
          'request': (await _saveDepartmentControlRegisterControlRequest(
            DepartmentControlRegisterControlRequest.fromJson(saved['request'])
                .copyWith
                .controlResult(
                  violation: request.violation,
                ),
          )).toJson(),
        });
      } else {
        await db.insert({
          'id': await _nextControlResultId,
          'type': 'updateControlRequest',
          'request': (await _saveDepartmentControlUpdateControlRequest(request)).toJson(),
        });
      }
      return ControlResult(
        id: request.dcControlResultId,
        violationExists: true,
        violation: request.violation,
        surveyDate: DateTime.now(),
      );
    });
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
                nextControlResultId: 0,
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
      if (request.objectName != null) 'name LIKE "${request.objectName}%"',
      if (request.externalId != null) 'externalId = ${request.externalId}',
      if (request.daysFromLastSurvey != null && request.daysFromLastSurvey != 0)
        '${DateTime.now().millisecondsSinceEpoch} - lastSurveyDate >= ${request.daysFromLastSurvey * Duration.millisecondsPerDay}',
      if (request.lastSurveyDateFrom != null)
        '${request.lastSurveyDateFrom.millisecondsSinceEpoch} < lastSurveyDate',
      if (request.lastSurveyDateTo != null)
        '${request.lastSurveyDateTo.millisecondsSinceEpoch + Duration.millisecondsPerDay} > lastSurveyDate',
    ];
    return params.isNotEmpty ? 'WHERE ${params.join(" AND ")}' : '';
  }

  String _generateOrderByStatement(DepartmentControlObjectsRequest request) {
    final sortStrings = <String>[
      if (request.sort == 'type') 'typeId ASC',
      if (['name', 'address', 'lastSurveyDate'].contains(request.sort))
        '${_ControlObjectsSql.TABLE_NAME}.${request.sort} ASC',
      if (request.userPositionX != null &&
          request.userPositionY != null &&
          request.searchRadius != null &&
          request.onlyNearObjects == true)
        'distance ASC',
    ];
    return sortStrings.isNotEmpty ? 'ORDER BY ${sortStrings.join(" , ")}' : '';
  }

  ControlResult fromRegisterControlResultRequest(
    DepartmentControlRegisterControlRequest request,
    int id,
  ) =>
      request.controlResult.copyWith(id: id);

  Future<int> get _nextControlResultId => objectDb.then((db) async {
        final metadata = await this.metadata;
        await saveMetadata(metadata.copyWith(
            nextControlResultId: metadata.nextControlResultId + 1));
        return metadata.nextControlResultId;
      });
  
  Future<void> _clearId() async {
    final metadata = await this.metadata;
    await saveMetadata(metadata.copyWith(
            nextControlResultId: 0));
  }

  Future<DCPhoto> _savePhoto(DCPhoto photo) async {
    final fileName = await ImagesService.saveImage(base64Decode(photo.data));
    return photo.copyWith(data: fileName);
  }

  Future<DCPhoto> _readPhoto(DCPhoto photo) async {
    final bytes = await ImagesService.readImage(photo.data);
    return photo.copyWith(data: base64Encode(bytes));
  }

  Future<DepartmentControlRegisterControlRequest>
      _saveDepartmentControlRegisterControlRequest(
    DepartmentControlRegisterControlRequest request,
  ) =>
          _processPhotosInDepartmentControlRegisterControlRequest(
            request,
            _savePhoto,
          );

  Future<DepartmentControlRegisterControlRequest>
      _readDepartmentControlRegisterControlRequest(
    DepartmentControlRegisterControlRequest request,
  ) =>
          _processPhotosInDepartmentControlRegisterControlRequest(
            request,
            _readPhoto,
          );

  Future<DepartmentControlRegisterControlRequest>
      _processPhotosInDepartmentControlRegisterControlRequest(
    DepartmentControlRegisterControlRequest request,
    Future<DCPhoto> Function(DCPhoto) processFunction,
  ) async {
    if (request.controlResult.violation != null) {
      return request.copyWith.controlResult.violation(
        photos: await Future.wait(
          request.controlResult.violation.photos.map(
            (e) => processFunction(
              e,
            ),
          ),
        ),
      );
    } else {
      return request;
    }
  }


  Future<DepartmentControlUpdateControlRequest>
      _saveDepartmentControlUpdateControlRequest(
    DepartmentControlUpdateControlRequest request,
  ) =>
          _processPhotosInDepartmentControlUpdateControlRequest(
            request,
            _savePhoto,
          );

  Future<DepartmentControlUpdateControlRequest>
      _readDepartmentControlUpdateControlRequest(
    DepartmentControlUpdateControlRequest request,
  ) =>
          _processPhotosInDepartmentControlUpdateControlRequest(
            request,
            _readPhoto,
          );

  Future<DepartmentControlUpdateControlRequest>
      _processPhotosInDepartmentControlUpdateControlRequest(
    DepartmentControlUpdateControlRequest request,
    Future<DCPhoto> Function(DCPhoto) processFunction,
  ) async {
    if (request.violation != null) {
      return request.copyWith.violation(
        photos: await Future.wait(
          request.violation.photos.map(
            (e) => processFunction(
              e,
            ),
          ),
        ),
      );
    } else {
      return request;
    }
  }

  ControlResultSearchResult _fromDepartmentControlRegisterControlRequest(DepartmentControlRegisterControlRequest e) => ControlResultSearchResult(
                    id: e.controlResult.id,
                    closureSentToCafap: false,
                    creationSentToCafap: false,
                    violationExists: e.controlResult.violationExists ??
                        e.controlResult.violation != null,
                    geometryX: e.controlResult.geometryX,
                    geometryY: e.controlResult.geometryY,
                    surveyDate: e.controlResult.surveyDate,
                    violation: e.controlResult.violation
                        ?.let((DCViolation it) => ViolationSearchResult(
                              additionalFeatures: it.additionalFeatures,
                              address: it.address,
                              btiAddress: it.btiAddress,
                              critical: it.critical,
                              id: it.id,
                              detectionDate: it.detectionDate,
                              description: it.description,
                              eknViolationClassification:
                                  it.eknViolationClassification,
                              otherViolationClassification:
                                  it.otherViolationClassification,
                              refAddressTinao: it.refAddressTinao,
                              objectElement: it.objectElement,
                              violator: it.violator,
                              resolveDate: it.resolveDate,
                              controlDate: it.controlDate,
                              photos: it.photos,
                            )),
                  );

  @override
  Future<void> removeLocalRequests() async { 
    await _registerRequests.then((value) => value.forEach((element) async { 
      if(element.controlResult.violation != null) {
        element.controlResult.violation.photos.forEach((photo) async {
          await ImagesService.removeImage(photo.data);
        });
      }
    }));
    await _updateRequests.then((value) => value.forEach((element) async { 
      if(element.violation != null) {
        element.violation.photos.forEach((photo) async {
          await ImagesService.removeImage(photo.data);
        });
      }
    }));
    await objectDb.then((db) async {
      ['registerControlRequest', 'removeControlRequest', 'updateControlRequest'].forEach((type) async {
        await db.remove({
          'type': type,
        });
      });
    });
    await _clearId();
  }
}
