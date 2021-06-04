// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_classification_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationClassificationSearchResult
    _$ViolationClassificationSearchResultFromJson(Map<String, dynamic> json) {
  return _ViolationClassificationSearchResult.fromJson(json);
}

/// @nodoc
class _$ViolationClassificationSearchResultTearOff {
  const _$ViolationClassificationSearchResultTearOff();

// ignore: unused_element
  _ViolationClassificationSearchResult call(
      {int id,
      ViolationName violationName,
      DCViolationType violationType,
      DCViolationKind violationKind,
      ObjectType objectType,
      ObjectElement objectElement,
      bool ekn,
      String warning,
      String regulations,
      String npa,
      String article}) {
    return _ViolationClassificationSearchResult(
      id: id,
      violationName: violationName,
      violationType: violationType,
      violationKind: violationKind,
      objectType: objectType,
      objectElement: objectElement,
      ekn: ekn,
      warning: warning,
      regulations: regulations,
      npa: npa,
      article: article,
    );
  }

// ignore: unused_element
  ViolationClassificationSearchResult fromJson(Map<String, Object> json) {
    return ViolationClassificationSearchResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationClassificationSearchResult =
    _$ViolationClassificationSearchResultTearOff();

/// @nodoc
mixin _$ViolationClassificationSearchResult {
  int get id;
  ViolationName get violationName;
  DCViolationType get violationType;
  DCViolationKind get violationKind;
  ObjectType get objectType;
  ObjectElement get objectElement;
  bool get ekn;
  String get warning;
  String get regulations;
  String get npa;
  String get article;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationClassificationSearchResultCopyWith<
      ViolationClassificationSearchResult> get copyWith;
}

/// @nodoc
abstract class $ViolationClassificationSearchResultCopyWith<$Res> {
  factory $ViolationClassificationSearchResultCopyWith(
          ViolationClassificationSearchResult value,
          $Res Function(ViolationClassificationSearchResult) then) =
      _$ViolationClassificationSearchResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      ViolationName violationName,
      DCViolationType violationType,
      DCViolationKind violationKind,
      ObjectType objectType,
      ObjectElement objectElement,
      bool ekn,
      String warning,
      String regulations,
      String npa,
      String article});

  $ViolationNameCopyWith<$Res> get violationName;
  $DCViolationTypeCopyWith<$Res> get violationType;
  $DCViolationKindCopyWith<$Res> get violationKind;
  $ObjectTypeCopyWith<$Res> get objectType;
  $ObjectElementCopyWith<$Res> get objectElement;
}

/// @nodoc
class _$ViolationClassificationSearchResultCopyWithImpl<$Res>
    implements $ViolationClassificationSearchResultCopyWith<$Res> {
  _$ViolationClassificationSearchResultCopyWithImpl(this._value, this._then);

  final ViolationClassificationSearchResult _value;
  // ignore: unused_field
  final $Res Function(ViolationClassificationSearchResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object violationName = freezed,
    Object violationType = freezed,
    Object violationKind = freezed,
    Object objectType = freezed,
    Object objectElement = freezed,
    Object ekn = freezed,
    Object warning = freezed,
    Object regulations = freezed,
    Object npa = freezed,
    Object article = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      violationName: violationName == freezed
          ? _value.violationName
          : violationName as ViolationName,
      violationType: violationType == freezed
          ? _value.violationType
          : violationType as DCViolationType,
      violationKind: violationKind == freezed
          ? _value.violationKind
          : violationKind as DCViolationKind,
      objectType:
          objectType == freezed ? _value.objectType : objectType as ObjectType,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      ekn: ekn == freezed ? _value.ekn : ekn as bool,
      warning: warning == freezed ? _value.warning : warning as String,
      regulations:
          regulations == freezed ? _value.regulations : regulations as String,
      npa: npa == freezed ? _value.npa : npa as String,
      article: article == freezed ? _value.article : article as String,
    ));
  }

  @override
  $ViolationNameCopyWith<$Res> get violationName {
    if (_value.violationName == null) {
      return null;
    }
    return $ViolationNameCopyWith<$Res>(_value.violationName, (value) {
      return _then(_value.copyWith(violationName: value));
    });
  }

  @override
  $DCViolationTypeCopyWith<$Res> get violationType {
    if (_value.violationType == null) {
      return null;
    }
    return $DCViolationTypeCopyWith<$Res>(_value.violationType, (value) {
      return _then(_value.copyWith(violationType: value));
    });
  }

  @override
  $DCViolationKindCopyWith<$Res> get violationKind {
    if (_value.violationKind == null) {
      return null;
    }
    return $DCViolationKindCopyWith<$Res>(_value.violationKind, (value) {
      return _then(_value.copyWith(violationKind: value));
    });
  }

  @override
  $ObjectTypeCopyWith<$Res> get objectType {
    if (_value.objectType == null) {
      return null;
    }
    return $ObjectTypeCopyWith<$Res>(_value.objectType, (value) {
      return _then(_value.copyWith(objectType: value));
    });
  }

  @override
  $ObjectElementCopyWith<$Res> get objectElement {
    if (_value.objectElement == null) {
      return null;
    }
    return $ObjectElementCopyWith<$Res>(_value.objectElement, (value) {
      return _then(_value.copyWith(objectElement: value));
    });
  }
}

/// @nodoc
abstract class _$ViolationClassificationSearchResultCopyWith<$Res>
    implements $ViolationClassificationSearchResultCopyWith<$Res> {
  factory _$ViolationClassificationSearchResultCopyWith(
          _ViolationClassificationSearchResult value,
          $Res Function(_ViolationClassificationSearchResult) then) =
      __$ViolationClassificationSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      ViolationName violationName,
      DCViolationType violationType,
      DCViolationKind violationKind,
      ObjectType objectType,
      ObjectElement objectElement,
      bool ekn,
      String warning,
      String regulations,
      String npa,
      String article});

  @override
  $ViolationNameCopyWith<$Res> get violationName;
  @override
  $DCViolationTypeCopyWith<$Res> get violationType;
  @override
  $DCViolationKindCopyWith<$Res> get violationKind;
  @override
  $ObjectTypeCopyWith<$Res> get objectType;
  @override
  $ObjectElementCopyWith<$Res> get objectElement;
}

/// @nodoc
class __$ViolationClassificationSearchResultCopyWithImpl<$Res>
    extends _$ViolationClassificationSearchResultCopyWithImpl<$Res>
    implements _$ViolationClassificationSearchResultCopyWith<$Res> {
  __$ViolationClassificationSearchResultCopyWithImpl(
      _ViolationClassificationSearchResult _value,
      $Res Function(_ViolationClassificationSearchResult) _then)
      : super(_value, (v) => _then(v as _ViolationClassificationSearchResult));

  @override
  _ViolationClassificationSearchResult get _value =>
      super._value as _ViolationClassificationSearchResult;

  @override
  $Res call({
    Object id = freezed,
    Object violationName = freezed,
    Object violationType = freezed,
    Object violationKind = freezed,
    Object objectType = freezed,
    Object objectElement = freezed,
    Object ekn = freezed,
    Object warning = freezed,
    Object regulations = freezed,
    Object npa = freezed,
    Object article = freezed,
  }) {
    return _then(_ViolationClassificationSearchResult(
      id: id == freezed ? _value.id : id as int,
      violationName: violationName == freezed
          ? _value.violationName
          : violationName as ViolationName,
      violationType: violationType == freezed
          ? _value.violationType
          : violationType as DCViolationType,
      violationKind: violationKind == freezed
          ? _value.violationKind
          : violationKind as DCViolationKind,
      objectType:
          objectType == freezed ? _value.objectType : objectType as ObjectType,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      ekn: ekn == freezed ? _value.ekn : ekn as bool,
      warning: warning == freezed ? _value.warning : warning as String,
      regulations:
          regulations == freezed ? _value.regulations : regulations as String,
      npa: npa == freezed ? _value.npa : npa as String,
      article: article == freezed ? _value.article : article as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationClassificationSearchResult
    extends _ViolationClassificationSearchResult {
  const _$_ViolationClassificationSearchResult(
      {this.id,
      this.violationName,
      this.violationType,
      this.violationKind,
      this.objectType,
      this.objectElement,
      this.ekn,
      this.warning,
      this.regulations,
      this.npa,
      this.article})
      : super._();

  factory _$_ViolationClassificationSearchResult.fromJson(
          Map<String, dynamic> json) =>
      _$_$_ViolationClassificationSearchResultFromJson(json);

  @override
  final int id;
  @override
  final ViolationName violationName;
  @override
  final DCViolationType violationType;
  @override
  final DCViolationKind violationKind;
  @override
  final ObjectType objectType;
  @override
  final ObjectElement objectElement;
  @override
  final bool ekn;
  @override
  final String warning;
  @override
  final String regulations;
  @override
  final String npa;
  @override
  final String article;

  @override
  String toString() {
    return 'ViolationClassificationSearchResult(id: $id, violationName: $violationName, violationType: $violationType, violationKind: $violationKind, objectType: $objectType, objectElement: $objectElement, ekn: $ekn, warning: $warning, regulations: $regulations, npa: $npa, article: $article)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationClassificationSearchResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.violationName, violationName) ||
                const DeepCollectionEquality()
                    .equals(other.violationName, violationName)) &&
            (identical(other.violationType, violationType) ||
                const DeepCollectionEquality()
                    .equals(other.violationType, violationType)) &&
            (identical(other.violationKind, violationKind) ||
                const DeepCollectionEquality()
                    .equals(other.violationKind, violationKind)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)) &&
            (identical(other.objectElement, objectElement) ||
                const DeepCollectionEquality()
                    .equals(other.objectElement, objectElement)) &&
            (identical(other.ekn, ekn) ||
                const DeepCollectionEquality().equals(other.ekn, ekn)) &&
            (identical(other.warning, warning) ||
                const DeepCollectionEquality()
                    .equals(other.warning, warning)) &&
            (identical(other.regulations, regulations) ||
                const DeepCollectionEquality()
                    .equals(other.regulations, regulations)) &&
            (identical(other.npa, npa) ||
                const DeepCollectionEquality().equals(other.npa, npa)) &&
            (identical(other.article, article) ||
                const DeepCollectionEquality().equals(other.article, article)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(violationName) ^
      const DeepCollectionEquality().hash(violationType) ^
      const DeepCollectionEquality().hash(violationKind) ^
      const DeepCollectionEquality().hash(objectType) ^
      const DeepCollectionEquality().hash(objectElement) ^
      const DeepCollectionEquality().hash(ekn) ^
      const DeepCollectionEquality().hash(warning) ^
      const DeepCollectionEquality().hash(regulations) ^
      const DeepCollectionEquality().hash(npa) ^
      const DeepCollectionEquality().hash(article);

  @JsonKey(ignore: true)
  @override
  _$ViolationClassificationSearchResultCopyWith<
          _ViolationClassificationSearchResult>
      get copyWith => __$ViolationClassificationSearchResultCopyWithImpl<
          _ViolationClassificationSearchResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationClassificationSearchResultToJson(this);
  }
}

abstract class _ViolationClassificationSearchResult
    extends ViolationClassificationSearchResult {
  const _ViolationClassificationSearchResult._() : super._();
  const factory _ViolationClassificationSearchResult(
      {int id,
      ViolationName violationName,
      DCViolationType violationType,
      DCViolationKind violationKind,
      ObjectType objectType,
      ObjectElement objectElement,
      bool ekn,
      String warning,
      String regulations,
      String npa,
      String article}) = _$_ViolationClassificationSearchResult;

  factory _ViolationClassificationSearchResult.fromJson(
          Map<String, dynamic> json) =
      _$_ViolationClassificationSearchResult.fromJson;

  @override
  int get id;
  @override
  ViolationName get violationName;
  @override
  DCViolationType get violationType;
  @override
  DCViolationKind get violationKind;
  @override
  ObjectType get objectType;
  @override
  ObjectElement get objectElement;
  @override
  bool get ekn;
  @override
  String get warning;
  @override
  String get regulations;
  @override
  String get npa;
  @override
  String get article;
  @override
  @JsonKey(ignore: true)
  _$ViolationClassificationSearchResultCopyWith<
      _ViolationClassificationSearchResult> get copyWith;
}
