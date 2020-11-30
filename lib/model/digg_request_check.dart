import 'package:flutter/material.dart';

class DiggRequestCheckStatus {
  static String workNotComplete = 'Работы не завершены';
  static String landscapingRestored = 'Благоустройство восстановлено';
  static String landscapingNotRestored = 'Благоустройство не восстановлено';
}

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

  DiggRequestCheck copyWith({bool workCompleted, bool landscapingRestored, String comment}) {
    return DiggRequestCheck(
      id: id,
      demandId: demandId,
      workCompleted: workCompleted,
      landscapingRestored: landscapingRestored,
      comment: comment,
      diggNum: diggNum,
      diggAddress: diggAddress
    );
  }

  factory DiggRequestCheck.fromJson(Map<String, dynamic> json) {
    return DiggRequestCheck(
      id: json['id'], 
      demandId: json['demandId'], 
      workCompleted: json['workCompleted'] ?? false,
      landscapingRestored: json['landscapingRestored'] ?? false,
      diggNum: json['diggNum'],
      diggAddress: json['diggAddress'],
      comment: json['comment'],
    );
  }

  String get status {
    if (workCompleted) {
      if (landscapingRestored) {
        return DiggRequestCheckStatus.landscapingRestored;
      } else {
        return DiggRequestCheckStatus.landscapingNotRestored;
      }
    } else {
      return DiggRequestCheckStatus.workNotComplete;
    }
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