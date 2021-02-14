import 'package:flutter/material.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key key, this.searchResult}) : super(key: key);

  final ControlResultSearchResult searchResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: ProjectColors.lightBlue),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 7, right: 7),
            alignment: Alignment.center,
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Дата обследования ${DateFormat("hh:mm dd.MM.yyyy").format(searchResult.surveyDate)}',
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
                ),
              ),
              padding:
                  const EdgeInsets.only(left: 10, top: 2, bottom: 4),
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'Нарушений не выявлено',
                style: ProjectTextStyles.smallBold
                    .apply(color: ProjectColors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
