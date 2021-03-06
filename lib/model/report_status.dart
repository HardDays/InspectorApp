import 'package:flutter/foundation.dart';

class ReportStatus {
  final int id;
  final String name;
  
  ReportStatus({
    @required this.id,
    this.name,
  });

  factory ReportStatus.fromJson(Map<String, dynamic> json) {
    return ReportStatus(
      id: json['id'], 
      name: json['name'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}