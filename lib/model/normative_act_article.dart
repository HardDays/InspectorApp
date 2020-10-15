import 'package:flutter/foundation.dart';

class NormativeActArticle {
  final int id;
  final String name;
  final String code;
  final int normativeActId;
  final String normativeAct;
  
  NormativeActArticle({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.normativeActId,
    @required this.normativeAct,
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

  @override
  String toString() {
    return '$code $name';
  }
}