import 'package:flutter/material.dart';
import 'package:inspector/model/control_object.dart';

import 'control_object/control_object_card.dart';

class ControlObjectsLoadedList extends StatelessWidget {
  final List<ControlObject> controlObjects;
  final void Function(ControlObject) open;
  final void Function(ControlObject) hasViolation;
  final void Function(ControlObject) hasNotViolation;
  final void Function(ControlObject) showInMap;

  const ControlObjectsLoadedList({
    Key key,
    @required this.controlObjects,
    @required this.open,
    @required this.hasViolation,
    @required this.hasNotViolation,
    @required this.showInMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      children: controlObjects
          .map(
            (e) => ControlObjectCard(
              controlObject: e,
              open: open,
              showInMap: showInMap,
              hasNotViolation: hasNotViolation,
              hasViolation: hasViolation,
            ),
          )
          .toList(),
    );
  }
}
