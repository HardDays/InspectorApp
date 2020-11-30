import 'package:flutter/foundation.dart';

class NormativeActArticle {
  final int id;
  final String name;
  final String code;
  final int normativeActId;
  final String normativeAct;
  
  NormativeActArticle({
    this.id,
    this.name,
    this.code,
    this.normativeActId,
    this.normativeAct,
  });

  factory NormativeActArticle.fromJson(Map<String, dynamic> json) {
    return NormativeActArticle(
      id: json['id'], 
      name: json['name'], 
      code: json['code'],
      normativeActId: json['normativeActId'],
      normativeAct: json['normativeAct'],
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'normativeActId': normativeActId,
      'normativeAct': normativeAct,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }

  @override
  String toString() {
    return [code, name].where((e) => e != null).join(' ');
  }
}