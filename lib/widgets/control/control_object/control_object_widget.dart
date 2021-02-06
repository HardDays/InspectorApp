import 'package:flutter/material.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/status.dart';
import 'package:intl/intl.dart';

class ControlObjectWidget extends StatelessWidget {
  final ControlObject controlObject;
  final void Function(ControlObject) onTap;

  const ControlObjectWidget({
    Key key,
    @required this.controlObject, 
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(controlObject),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      ControlStatusWidget(
                        controlObject.type.name,
                        controlObject.id.toString(),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            controlObject.address ?? '',
                            style: ProjectTextStyles.base
                                .apply(color: ProjectColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  controlObject.area ?? '',
                  style: ProjectTextStyles.base
                      .apply(color: ProjectColors.darkBlue),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                controlObject.balanceOwner ?? '',
                style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  _buildIcon(
                      ProjectIcons.cameraIcon(), controlObject.cameraCount.toString()),
                  _buildIcon(
                      ProjectIcons.alertIcon(), controlObject.violationsCount ?? '0'),
                  if (controlObject.lastSurveyDate != null)
                    _buildDate(controlObject.lastSurveyDate),
                  if (controlObject.geometry == null) 
                    ProjectIcons.mapCloseIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(DateTime date) {
    String daysText = '';
    int days = DateTime.now().difference(date).inDays;
    switch(days){
      case 0:
        daysText = '';
        break;
      case 1:
        daysText = '1 день';
        break;
      case 2:
      case 3:
      case 4:
        daysText = '2 дня';
        break;
      default:
        daysText = '$days дней';
    }
    return Row(
      children: [
        _buildIcon(
          ProjectIcons.calendarIcon(),
          '${DateFormat("dd.MM.yyyy").format(date)} ($daysText)',
        ), 
      ],
    );
  }

  Widget _buildIcon(Widget icon, Object title) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 15),
          child: Text(
            title.toString(),
            style: ProjectTextStyles.base.apply(color: ProjectColors.black),
          ),
        ),
      ],
    );
  }
}
