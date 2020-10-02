import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/assignment/assignment.dart';
import 'package:inspector/widgets/filter_appbar.dart';

class AssignmentListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppbar('Поручения'),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          AssignmentWidget(
            'Назначено',
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
            'На исполнении',
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

}
