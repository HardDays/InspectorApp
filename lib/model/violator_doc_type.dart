import 'package:flutter/foundation.dart';
import 'dart:convert' as c;

class ViolatorDocumentType {
    final int id;
  final String name;

  ViolatorDocumentType({
    @required this.id,
    @required this.name,
  });

  factory ViolatorDocumentType.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return ViolatorDocumentType(
        id: json['id'],
        name: json['name'],
      );
    }
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

  static ViolatorDocumentType parse(dynamic json, bool stringified) {
    if (json != null) {
      if (stringified) {
        return ViolatorDocumentType.fromJson(c.json.decode(json));
      } else {
        return ViolatorDocumentType.fromJson(json);
      }
    }
  }
}