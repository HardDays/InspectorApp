import 'dart:ui';

import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/report.dart';

abstract class ProjectColors {
  static const blue = Color(0xFF4375A0);
  static const darkBlue = Color(0xFF7391AB);
  static const mediumBlue = Color(0xFFB9C4D0);
  static const lightBlue = Color(0xFFD2DDEA);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF45474B);
  static const grey = Color(0xFFF6F8F9);
  static const red = Color(0xFFE50909);
  static const green = Color(0xFF58AA43);
  static const yellow = Color(0xFFFDA91A);
  static const cyan = Color(0xFF07A6BA);
  static const brown = Color(0xFF79390B);
}

abstract class InstructionStatusColors {
  static const _colors = const {
    InstructionStatusIds.assigned: ProjectColors.cyan,
    InstructionStatusIds.withdrawn: ProjectColors.red,
    InstructionStatusIds.partInProgress: ProjectColors.blue,
    InstructionStatusIds.inProgress: ProjectColors.yellow,
    InstructionStatusIds.partComplete: ProjectColors.yellow,
    InstructionStatusIds.complete: ProjectColors.green
  };

  static Color color(int status) {
    if (_colors.containsKey(status)) {
      return _colors[status];
    } else {
      return ProjectColors.cyan;
    }
  }
}

abstract class ReportStatusColors {
  static const _colors = const {
    ReportStatusIds.project: ProjectColors.cyan,
    ReportStatusIds.new_: ProjectColors.cyan,
    ReportStatusIds.onApproval: ProjectColors.yellow,
    ReportStatusIds.accepted: ProjectColors.green,
    ReportStatusIds.declined: ProjectColors.red,
    ReportStatusIds.changed: ProjectColors.red
  };

  static Color color(int status) {
    if (_colors.containsKey(status)) {
      return _colors[status];
    } else {
      return ProjectColors.cyan;
    }
  }
}

abstract class CheckStatusColors {
  static const _colors = const {
    CheckStatusIds.assigned: ProjectColors.cyan,
    CheckStatusIds.withdrawn: ProjectColors.red,
    CheckStatusIds.inProgress: ProjectColors.yellow,
    CheckStatusIds.reportSent: ProjectColors.green,
  };

  static Color color(int status) {
    if (_colors.containsKey(status)) {
      return _colors[status];
    } else {
      return ProjectColors.cyan;
    }
  }
}

abstract class DiggRequestCheckColors {

  static Color color(bool workCompleted, bool landscapingRestored) {
    if (workCompleted ?? false) {
      if (landscapingRestored ?? false) {
        return ProjectColors.green;
      } else {
        return ProjectColors.black;
      }
    } else {
      return ProjectColors.yellow;
    } 
  }
}