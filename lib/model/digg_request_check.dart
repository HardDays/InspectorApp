import 'package:flutter/material.dart';

class DiggRequestCheck {

  final int id;
  final int demandId;
  final bool workCompleted;
  final bool landscapingRestored;
  final String diggNum;
  final String diggAddress;
  final String comment;

  DiggRequestCheck({
    @required this.id,
    @required this.demandId,
    @required this.workCompleted,
    @required this.landscapingRestored,
    @required this.diggNum,
    @required this.diggAddress,
    @required this.comment,
  });

  factory DiggRequestCheck.fromJson(Map<String, dynamic> json) {
    return DiggRequestCheck(
      id: json['id'], 
      demandId: json['demandId'], 
      workCompleted: json['workCompleted'],
      landscapingRestored: json['landscapingRestored'],
      diggNum: json['diggNum'],
      diggAddress: json['diggAddress'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'demandId': demandId,
      'workCompleted': workCompleted,
      'landscapingRestored': landscapingRestored,
      'diggNum': diggNum,
      'diggAddress': diggAddress,
      'comment': comment,
    };
  }
}