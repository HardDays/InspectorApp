// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_status_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportStatusInfo _$ReportStatusInfoFromJson(Map<String, dynamic> json) {
  return ReportStatusInfo(
    reportNum: json['reportNum'] as String,
    reportStatus: json['reportStatus'] == null
        ? null
        : ReportStatus.fromJson(json['reportStatus'] as Map<String, dynamic>),
    rejectReason: json['rejectReason'] as String,
    respEmployee: json['respEmployee'] == null
        ? null
        : EmployeeShort.fromJson(json['respEmployee'] as Map<String, dynamic>),
    violators: json['violators'] == null
        ? null
        : ViolatorResolution.fromJson(
            json['violators'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReportStatusInfoToJson(ReportStatusInfo instance) =>
    <String, dynamic>{
      'reportNum': instance.reportNum,
      'reportStatus': instance.reportStatus,
      'rejectReason': instance.rejectReason,
      'respEmployee': instance.respEmployee,
      'violators': instance.violators,
    };

EmployeeShort _$EmployeeShortFromJson(Map<String, dynamic> json) {
  return EmployeeShort(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$EmployeeShortToJson(EmployeeShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ViolatorResolution _$ViolatorResolutionFromJson(Map<String, dynamic> json) {
  return ViolatorResolution(
    violatorId: json['violatorId'] as int,
    resolutionType: json['resolutionType'] == null
        ? null
        : ResolutionType.fromJson(
            json['resolutionType'] as Map<String, dynamic>),
    resolutionDate: json['resolutionDate'] as String,
    resolutionText: json['resolutionText'] as String,
    executor: json['executor'] == null
        ? null
        : EmployeeShort.fromJson(json['executor'] as Map<String, dynamic>),
    author: json['author'] == null
        ? null
        : EmployeeShort.fromJson(json['author'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ViolatorResolutionToJson(ViolatorResolution instance) =>
    <String, dynamic>{
      'violatorId': instance.violatorId,
      'resolutionType': instance.resolutionType,
      'resolutionDate': instance.resolutionDate,
      'resolutionText': instance.resolutionText,
      'executor': instance.executor,
      'author': instance.author,
    };
