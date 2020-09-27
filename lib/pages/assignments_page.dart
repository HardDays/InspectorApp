import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignments/addresses.dart';
import 'package:inspector/widgets/assignments/assignment.dart';
import 'package:inspector/widgets/assignments/paragraph.dart';
import 'package:inspector/widgets/assignments/status.dart';
import 'package:intl/intl.dart';

class AssignmentsPage extends StatelessWidget {

  void onSort(BuildContext context) async {
    await showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSort(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Text(
                'Поручения',
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
                margin: const EdgeInsets.only(left: 8),
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
          _buildIcon(context, ProjectIcons.sortIcon(color: Colors.white), 'По дате получения'),
          _buildIcon(context, ProjectIcons.filterIcon(color: Colors.white), 'Фильтр'),
          Padding(padding: const EdgeInsets.only(right: 15))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          AssignmentWidget(
            [
              {
                'task': 'task task taks',
                'addresses': ['address addr', 'addrress']
              },
              {
                'task': 'task task taks',
                'addresses': ['address addr']
              }
            ]
          ),
          AssignmentWidget(
            [
              {
                'task': 'task task taks',
                'addresses': ['address addr']
              }
            ]
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context, Widget icon, String title) {
    return InkWell(
      onTap: ()=> onSort(context),
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

  Widget _buildSort(BuildContext context) {
    final titles = ['по дате поручения', 'по дате обследования', 'по статусу поручения', 'по номеру поручения'];
    final selected = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, bottom: 15),
                child: Text('Сортировать...',
                  style: ProjectTextStyles.title.apply(color: ProjectColors.blue)
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(titles.length, 
                  (index) => InkWell(
                    onTap: ()=> Navigator.pop(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      color: index == selected ? ProjectColors.blue : Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(titles[index],
                            style: ProjectTextStyles.base.apply(color: index == selected ? Colors.white : ProjectColors.black),
                          ),
                          Icon(Icons.check,
                            size: 18,
                            color: index == selected ? Colors.white : Colors.transparent,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
