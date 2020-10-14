import 'package:flutter/foundation.dart';

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
}