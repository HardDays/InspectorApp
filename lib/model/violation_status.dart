import 'package:flutter/foundation.dart';

class ViolationStatus {
  final int id;
  final String name;

  ViolationStatus({
    @required this.id,
    @required this.name,
  });

  factory ViolationStatus.fromJson(Map<String, dynamic> json) {
    return ViolationStatus(
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
