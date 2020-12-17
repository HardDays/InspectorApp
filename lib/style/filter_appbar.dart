import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class FilterAppbar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  final String date;
  final String sort;
  final String order;
  final Widget titleIcon;
  final Function onUpdate;
  final Function onSort;
  final Function onFilter;

  FilterAppbar(
    this.title, 
    this.date, 
    this.sort, 
    this.order,
    {
      this.titleIcon,
      this.onUpdate,
      this.onSort,
      this.onFilter
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
              child: titleIcon,
            )
          ],
        ),
      ),
      actions: [
        _buildIcon(Icon(Icons.refresh, size: 25), date, onUpdate),
        _buildSort(),
        _buildIcon(ProjectIcons.filterIcon(color: Colors.white), 'Фильтр', onFilter),
        Padding(padding: const EdgeInsets.only(right: 20))
      ],
    );
  }

  Widget _buildSort() {
    if (order == SortOrder.asc) {
      return _buildIcon(ProjectIcons.sortIcon(color: Colors.white), sort, onSort);
    } else {
      return _buildIcon(
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(3.14)..rotateY(3.14),
          child: ProjectIcons.sortIcon(color: Colors.white)
        ), 
        sort, 
        onSort
      );
    }
  }

  Widget _buildIcon(Widget icon, String title, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Text(title,
              style: ProjectTextStyles.small,
            ),
          )
        ],
      ),
    );
  }
}
