import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/violation/action/violation_action.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key key,
    this.searchResult,
    this.onRemove,
  }) : super(key: key);

  final ControlResultSearchResult searchResult;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              if (onRemove != null)
                ViolationAction(
                  text: 'Удалить',
                  icon: ProjectIcons.delete1Icon(),
                  onTap: onRemove,
                ),
            ],
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: ProjectColors.lightBlue),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 53, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Дата обследования\n${DateFormat("HH:mm dd.MM.yyyy").format(searchResult.surveyDate)}',
                          style: ProjectTextStyles.baseBold
                              .apply(color: ProjectColors.blue),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ProjectColors.green,
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 10, top: 2, bottom: 4, right: 10),
                      margin: EdgeInsets.only(top: 15, right: 15),
                      child: Text(
                        'Нарушений не выявлено',
                        style: ProjectTextStyles.smallBold
                            .apply(color: ProjectColors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 7, right: 7),
          alignment: Alignment.center,
          height: 100,
          width: 33,
          decoration: BoxDecoration(
            color: ProjectColors.yellow,
          ),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              'ОАТИ',
              style: ProjectTextStyles.baseBold
                  .apply(color: ProjectColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
