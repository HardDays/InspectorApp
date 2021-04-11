import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/widgets/control/control_object/control_object_card.dart';

class ControlObjectsPaginatedList extends StatefulWidget {
  final List<ControlObject> controlObjects;
  final void Function(ControlObject) open;
  final void Function(ControlObject) hasViolation;
  final void Function(ControlObject) hasNotViolation;
  final void Function(ControlObject) showInMap;
  final void Function() loadNextPage;

  const ControlObjectsPaginatedList({
    Key key,
    @required this.controlObjects,
    @required this.open,
    @required this.hasViolation,
    @required this.hasNotViolation,
    @required this.showInMap,
    @required this.loadNextPage,
  }) : super(key: key);

  @override
  _ControlObjectsPaginatedListState createState() =>
      _ControlObjectsPaginatedListState();
}

class _ControlObjectsPaginatedListState
    extends State<ControlObjectsPaginatedList> {
  ScrollController _scrollController = ScrollController();

  _ControlObjectsPaginatedListState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.loadNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      children: [
        ...widget.controlObjects
            .map(
              (e) => ControlObjectCard(
                controlObject: e,
                open: widget.open,
                showInMap: widget.showInMap,
                hasNotViolation: widget.hasNotViolation,
                hasViolation: widget.hasViolation,
              ),
            )
            .toList(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}
