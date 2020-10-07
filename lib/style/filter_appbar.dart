import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class FilterAppbar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  final String date;
  final String sort;
  final Function onUpdate;
  final Function onSort;

  FilterAppbar(
    this.title, 
    this.date, 
    this.sort, {
      this.onUpdate,
      this.onSort
    }
  );


  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ProjectColors.darkBlue,
      title: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: [
            Text(
              title,
              style: ProjectTextStyles.title.apply(
                color: ProjectColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ProjectColors.blue
              ),  
              margin: const EdgeInsets.only(left: 8, top: 3),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ProjectColors.cyan
                    ),
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                    child: Text('1',
                      style: ProjectTextStyles.baseBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    child: Text('1',
                      style: ProjectTextStyles.baseBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        _buildIcon(Icon(Icons.refresh, size: 25), date, onUpdate),
        _buildIcon(ProjectIcons.sortIcon(color: Colors.white), sort, onSort),
        _buildIcon(ProjectIcons.filterIcon(color: Colors.white), 'Фильтр', ()=> {}),
        Padding(padding: const EdgeInsets.only(right: 15))
      ],
    );
  }

  Widget _buildIcon(Widget icon, String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 15),
            child: Text(title,
              style: ProjectTextStyles.small,
            ),
          )
        ],
      ),
    );
  }

}
