import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/violation/action/violation_action.dart';
import 'package:intl/intl.dart';

class ControlViolationWidget extends StatefulWidget {
  const ControlViolationWidget({
    Key key,
    this.source,
    this.violationNum,
    this.detectionDate,
    this.objectElement,
    this.violationName,
    this.photos,
    this.violationStatus,
    this.onClick,
    this.onCompleted,
    this.onNotCompleted,
    this.onRemove,
  }) : super(key: key);

  final Source source;
  final String violationNum;
  final DateTime detectionDate;
  final ObjectElement objectElement;
  final ViolationName violationName;
  final List<DCPhoto> photos;
  final ViolationStatus violationStatus;
  final void Function() onClick;
  final void Function() onCompleted;
  final void Function() onNotCompleted;
  final void Function() onRemove;

  @override
  ControlViolationWidgetState createState() => ControlViolationWidgetState();
}

class ControlViolationWidgetState extends State<ControlViolationWidget> {
  SlidableController _controller;

  bool _actions = false;

  @override
  void initState() {
    super.initState();

    _controller = SlidableController(
        onSlideIsOpenChanged: _onSlideableChange,
        onSlideAnimationChanged: (t) => {});
  }

  void _onSlideableChange(bool value) {
    setState(() {
      print(value);
      _actions = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: ProjectColors.lightBlue),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 7, right: 7),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.source.name == 'ЦАФАП'
                      ? ProjectColors.darkBlue
                      : ProjectColors.yellow,
                ),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    widget.source.name,
                    style: ProjectTextStyles.baseBold
                        .apply(color: ProjectColors.white),
                  ),
                ),
              ),
              Flexible(
                child: ClipRect(
                  child: Slidable(
                    controller: _controller,
                    actionExtentRatio: 0.15,
                    actionPane: SlidableDrawerActionPane(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Нарушение ${widget.violationNum ?? ""} от ${DateFormat("hh:mm dd.MM.yyyy").format(widget.detectionDate)}',
                                  style: ProjectTextStyles.baseBold
                                      .apply(color: ProjectColors.blue),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text(
                                    widget.objectElement.objectType?.name ?? '',
                                    style: ProjectTextStyles.base
                                        .apply(color: ProjectColors.black),
                                  ),
                                ),
                                Text(
                                  widget.violationName.name,
                                  style: ProjectTextStyles.base
                                      .apply(color: ProjectColors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.photos != null &&
                                widget.photos.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                  right: 15,
                                ),
                                child: Image(
                                  width: 120,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  image: MemoryImage(
                                    base64.decode(widget.photos.first.data),
                                  ),
                                ),
                              ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: ProjectColors.cyan,
                                    ),
                                    top: BorderSide(
                                      color: ProjectColors.cyan,
                                    ),
                                    bottom: BorderSide(
                                      color: ProjectColors.cyan,
                                    ),
                                    right: _actions
                                        ? BorderSide(
                                            color: ProjectColors.cyan,
                                          )
                                        : BorderSide(
                                            width: 0,
                                            color: Colors.transparent,
                                          ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 2, bottom: 4),
                                margin: EdgeInsets.only(
                                    top: 15, right: _actions ? 15 : 0),
                                child: Text(
                                  widget.violationStatus.name,
                                  style: ProjectTextStyles.smallBold
                                      .apply(color: ProjectColors.cyan),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    secondaryActions: [
                      ViolationAction(
                        text: 'Устранено',
                        icon: Icon(
                          Icons.check,
                          color: ProjectColors.green,
                          size: 26,
                        ),
                        onTap: widget.onCompleted,
                      ),
                      ViolationAction(
                        text: 'Не устранено',
                        icon: Icon(
                          Icons.close,
                          color: ProjectColors.red,
                          size: 26,
                        ),
                        onTap: widget.onNotCompleted,
                      ),
                      if (widget.onRemove != null)
                        ViolationAction(
                          text: 'Удалить',
                          icon: ProjectIcons.delete1Icon(),
                          onTap: widget.onRemove,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
