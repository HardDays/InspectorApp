import 'package:date_range_picker/date_range_picker.dart' as dr;
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/input_title.dart';
import 'package:inspector/style/text_style.dart';
import 'package:intl/intl.dart';

class ProjectDatePicker extends StatelessWidget { 

  final bool singleDate;
  final String title;
  final List<DateTime> values;
  final String hintText;
  final Function(List<DateTime>) onChanged;

  ProjectDatePicker({
    this.title, 
    this.hintText, 
    this.values,
    this.onChanged,
    this.singleDate = false,
  });

  void _onTap(BuildContext context) async {
    if (singleDate) {
      final picked = await showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(1917),
        lastDate: DateTime(2050)
      );
      if (picked != null) {
         onChanged([picked]);
      }
    } else {
      final List<DateTime> picked = await dr.showDatePicker(
        context: context,
        initialFirstDate: DateTime.now(),
        initialLastDate: (DateTime.now()).add(Duration(days: 7)),
        firstDate: DateTime(2018),
        lastDate: DateTime(2050)
      );
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProjectInputTitle(
      title,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ProjectColors.lightBlue)
        ),
        padding: const EdgeInsets.only(top: 12.5, bottom: 13.5, left: 10, right: 10),
        child: InkWell(
          onTap: ()=> _onTap(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(values != null ? values.map((e) => DateFormat('dd.MM.yyyy').format(e)).join(' - ') : hintText,
                style: ProjectTextStyles.base.apply(color: values != null ? ProjectColors.black : ProjectColors.darkBlue),
              ),
              ProjectIcons.calendarIcon()
            ],
          ),
        ),
      )
    );
  }
}