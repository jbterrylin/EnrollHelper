import 'package:flutter/material.dart';

class Class {
  Class(this.id);

  int id;
  int priority = 1;
  String classcode;
  List<int> day = new List();
  List<TimeOfDay> time = new List();
}
