import 'package:flutter/material.dart';

abstract class HasDate extends StatelessWidget {
  const HasDate({Key key}) : super(key: key);

  DateTime get date;
}