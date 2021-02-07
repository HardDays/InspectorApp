// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'control_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ControlObject _$ControlObjectFromJson(Map<String, dynamic> json) {
  return _ControlObject.fromJson(json);
}

/// @nodoc
class _$ControlObjectTearOff {
  const _$ControlObjectTearOff();

// ignore: unused_element
  _ControlObject call(
      {int id,
      int externalId,
      ObjectType type,
      String kind,
      String name,
      String area,
      String district,
      String address,
      String balanceOwner,
      Contractor contractor,
      int cameraCount,
      String violationsCount,
      DateTime lastSurveyDate,
      String rowColor,
      List<MapGeometricObject> geometry,
      List<ViolationShortSearchResult> violations}) {
    return _ControlObject(
      id: id,
      externalId: externalId,
      type: type,
      kind: kind,
      name: name,
      area: area,
      district: district,
      address: address,
      balanceOwner: balanceOwner,
      contractor: contractor,
      cameraCount: cameraCount,
      violationsCount: violationsCount,
      lastSurveyDate: lastSurveyDate,
      rowColor: rowColor,
      geometry: geometry,
      violations: violations,
    );
  }

// ignore: unused_element
  ControlObject fromJson(Map<String, Object> json) {
    return ControlObject.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObject = _$ControlObjectTearOff();

/// @nodoc
mixin _$ControlObject {
  int get id;
  int get externalId;
  ObjectType get type;
  String get kind;
  String get name;
  String get area;
  String get district;
  String get address;
  String get balanceOwner;
  Contractor get contractor;
  int get cameraCount;
  String get violationsCount;
  DateTime get lastSurveyDate;
  String get rowColor;
  List<MapGeometricObject> get geometry;
  List<ViolationShortSearchResult> get violations;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ControlObjectCopyWith<ControlObject> get copyWith;
}

/// @nodoc
abstract class $ControlObjectCopyWith<$Res> {
  factory $ControlObjectCopyWith(
          ControlObject value, $Res Function(ControlObject) then) =
      _$ControlObjectCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int externalId,
      ObjectType type,
      String kind,
      String name,
      String area,
      String district,
      String address,
      String balanceOwner,
      Contractor contractor,
      int cameraCount,
      String violationsCount,
      DateTime lastSurveyDate,
      String rowColor,
      List<MapGeometricObject> geometry,
      List<ViolationShortSearchResult> violations});

  $ObjectTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ControlObjectCopyWithImpl<$Res>
    implements $ControlObjectCopyWith<$Res> {
  _$ControlObjectCopyWithImpl(this._value, this._then);

  final ControlObject _value;
  // ignore: unused_field
  final $Res Function(ControlObject) _then;

  @override
  $Res call({
    Object id = freezed,
    Object externalId = freezed,
    Object type = freezed,
    Object kind = freezed,
    Object name = freezed,
    Object area = freezed,
    Object district = freezed,
    Object address = freezed,
    Object balanceOwner = freezed,
    Object contractor = freezed,
    Object cameraCount = freezed,
    Object violationsCount = freezed,
    Object lastSurveyDate = freezed,
    Object rowColor = freezed,
    Object geometry = freezed,
    Object violations = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
      type: type == freezed ? _value.type : type as ObjectType,
      kind: kind == freezed ? _value.kind : kind as String,
      name: name == freezed ? _value.name : name as String,
      area: area == freezed ? _value.area : area as String,
      district: district == freezed ? _value.district : district as String,
      address: address == freezed ? _value.address : address as String,
      balanceOwner: balanceOwner == freezed
          ? _value.balanceOwner
          : balanceOwner as String,
      contractor:
          contractor == freezed ? _value.contractor : contractor as Contractor,
      cameraCount:
          cameraCount == freezed ? _value.cameraCount : cameraCount as int,
      violationsCount: violationsCount == freezed
          ? _value.violationsCount
          : violationsCount as String,
      lastSurveyDate: lastSurveyDate == freezed
          ? _value.lastSurveyDate
          : lastSurveyDate as DateTime,
      rowColor: rowColor == freezed ? _value.rowColor : rowColor as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry as List<MapGeometricObject>,
      violations: violations == freezed
          ? _value.violations
          : violations as List<ViolationShortSearchResult>,
    ));
  }

  @override
  $ObjectTypeCopyWith<$Res> get type {
    if (_value.type == null) {
      return null;
    }
    return $ObjectTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
abstract class _$ControlObjectCopyWith<$Res>
    implements $ControlObjectCopyWith<$Res> {
  factory _$ControlObjectCopyWith(
          _ControlObject value, $Res Function(_ControlObject) then) =
      __$ControlObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int externalId,
      ObjectType type,
      String kind,
      String name,
      String area,
      String district,
      String address,
      String balanceOwner,
      Contractor contractor,
      int cameraCount,
      String violationsCount,
      DateTime lastSurveyDate,
      String rowColor,
      List<MapGeometricObject> geometry,
      List<ViolationShortSearchResult> violations});

  @override
  $ObjectTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$ControlObjectCopyWithImpl<$Res>
    extends _$ControlObjectCopyWithImpl<$Res>
    implements _$ControlObjectCopyWith<$Res> {
  __$ControlObjectCopyWithImpl(
      _ControlObject _value, $Res Function(_ControlObject) _then)
      : super(_value, (v) => _then(v as _ControlObject));

  @override
  _ControlObject get _value => super._value as _ControlObject;

  @override
  $Res call({
    Object id = freezed,
    Object externalId = freezed,
    Object type = freezed,
    Object kind = freezed,
    Object name = freezed,
    Object area = freezed,
    Object district = freezed,
    Object address = freezed,
    Object balanceOwner = freezed,
    Object contractor = freezed,
    Object cameraCount = freezed,
    Object violationsCount = freezed,
    Object lastSurveyDate = freezed,
    Object rowColor = freezed,
    Object geometry = freezed,
    Object violations = freezed,
  }) {
    return _then(_ControlObject(
      id: id == freezed ? _value.id : id as int,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
      type: type == freezed ? _value.type : type as ObjectType,
      kind: kind == freezed ? _value.kind : kind as String,
      name: name == freezed ? _value.name : name as String,
      area: area == freezed ? _value.area : area as String,
      district: district == freezed ? _value.district : district as String,
      address: address == freezed ? _value.address : address as String,
      balanceOwner: balanceOwner == freezed
          ? _value.balanceOwner
          : balanceOwner as String,
      contractor:
          contractor == freezed ? _value.contractor : contractor as Contractor,
      cameraCount:
          cameraCount == freezed ? _value.cameraCount : cameraCount as int,
      violationsCount: violationsCount == freezed
          ? _value.violationsCount
          : violationsCount as String,
      lastSurveyDate: lastSurveyDate == freezed
          ? _value.lastSurveyDate
          : lastSurveyDate as DateTime,
      rowColor: rowColor == freezed ? _value.rowColor : rowColor as String,
      geometry: geometry == freezed
          ? _value.geometry
          : geometry as List<MapGeometricObject>,
      violations: violations == freezed
          ? _value.violations
          : violations as List<ViolationShortSearchResult>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ControlObject implements _ControlObject {
  const _$_ControlObject(
      {this.id,
      this.externalId,
      this.type,
      this.kind,
      this.name,
      this.area,
      this.district,
      this.address,
      this.balanceOwner,
      this.contractor,
      this.cameraCount,
      this.violationsCount,
      this.lastSurveyDate,
      this.rowColor,
      this.geometry,
      this.violations});

  factory _$_ControlObject.fromJson(Map<String, dynamic> json) =>
      _$_$_ControlObjectFromJson(json);

  @override
  final int id;
  @override
  final int externalId;
  @override
  final ObjectType type;
  @override
  final String kind;
  @override
  final String name;
  @override
  final String area;
  @override
  final String district;
  @override
  final String address;
  @override
  final String balanceOwner;
  @override
  final Contractor contractor;
  @override
  final int cameraCount;
  @override
  final String violationsCount;
  @override
  final DateTime lastSurveyDate;
  @override
  final String rowColor;
  @override
  final List<MapGeometricObject> geometry;
  @override
  final List<ViolationShortSearchResult> violations;

  @override
  String toString() {
    return 'ControlObject(id: $id, externalId: $externalId, type: $type, kind: $kind, name: $name, area: $area, district: $district, address: $address, balanceOwner: $balanceOwner, contractor: $contractor, cameraCount: $cameraCount, violationsCount: $violationsCount, lastSurveyDate: $lastSurveyDate, rowColor: $rowColor, geometry: $geometry, violations: $violations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlObject &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)) &&
            (identical(other.district, district) ||
                const DeepCollectionEquality()
                    .equals(other.district, district)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.balanceOwner, balanceOwner) ||
                const DeepCollectionEquality()
                    .equals(other.balanceOwner, balanceOwner)) &&
            (identical(other.contractor, contractor) ||
                const DeepCollectionEquality()
                    .equals(other.contractor, contractor)) &&
            (identical(other.cameraCount, cameraCount) ||
                const DeepCollectionEquality()
                    .equals(other.cameraCount, cameraCount)) &&
            (identical(other.violationsCount, violationsCount) ||
                const DeepCollectionEquality()
                    .equals(other.violationsCount, violationsCount)) &&
            (identical(other.lastSurveyDate, lastSurveyDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastSurveyDate, lastSurveyDate)) &&
            (identical(other.rowColor, rowColor) ||
                const DeepCollectionEquality()
                    .equals(other.rowColor, rowColor)) &&
            (identical(other.geometry, geometry) ||
                const DeepCollectionEquality()
                    .equals(other.geometry, geometry)) &&
            (identical(other.violations, violations) ||
                const DeepCollectionEquality()
                    .equals(other.violations, violations)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(area) ^
      const DeepCollectionEquality().hash(district) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(balanceOwner) ^
      const DeepCollectionEquality().hash(contractor) ^
      const DeepCollectionEquality().hash(cameraCount) ^
      const DeepCollectionEquality().hash(violationsCount) ^
      const DeepCollectionEquality().hash(lastSurveyDate) ^
      const DeepCollectionEquality().hash(rowColor) ^
      const DeepCollectionEquality().hash(geometry) ^
      const DeepCollectionEquality().hash(violations);

  @JsonKey(ignore: true)
  @override
  _$ControlObjectCopyWith<_ControlObject> get copyWith =>
      __$ControlObjectCopyWithImpl<_ControlObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ControlObjectToJson(this);
  }
}

abstract class _ControlObject implements ControlObject {
  const factory _ControlObject(
      {int id,
      int externalId,
      ObjectType type,
      String kind,
      String name,
      String area,
      String district,
      String address,
      String balanceOwner,
      Contractor contractor,
      int cameraCount,
      String violationsCount,
      DateTime lastSurveyDate,
      String rowColor,
      List<MapGeometricObject> geometry,
      List<ViolationShortSearchResult> violations}) = _$_ControlObject;

  factory _ControlObject.fromJson(Map<String, dynamic> json) =
      _$_ControlObject.fromJson;

  @override
  int get id;
  @override
  int get externalId;
  @override
  ObjectType get type;
  @override
  String get kind;
  @override
  String get name;
  @override
  String get area;
  @override
  String get district;
  @override
  String get address;
  @override
  String get balanceOwner;
  @override
  Contractor get contractor;
  @override
  int get cameraCount;
  @override
  String get violationsCount;
  @override
  DateTime get lastSurveyDate;
  @override
  String get rowColor;
  @override
  List<MapGeometricObject> get geometry;
  @override
  List<ViolationShortSearchResult> get violations;
  @override
  @JsonKey(ignore: true)
  _$ControlObjectCopyWith<_ControlObject> get copyWith;
}
