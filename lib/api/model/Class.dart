import 'package:flutter_mobx_cb/api/model/Day.dart';

class Class {
  Class(this.id);

  Class.fromClass(
      {this.id, this.type, this.priority, this.classcode, this.days});

  int id;
  String type = "default";
  int priority = 99;
  String classcode;
  List<Day> days = new List<Day>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'priority': priority,
        'classcode': classcode,
        'days': days,
      };

  factory Class.fromJson(Map<String, dynamic> json) {
    var list = json['days'] as List;

    return new Class.fromClass(
        id: json['id'],
        type: json['type'],
        priority: json['priority'],
        classcode: json['classcode'],
        days: list.map((i) => Day.fromJson(i)).toList());
    // .cast<List<String>>());
  }

  // Class.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       priority = json['priority'],
  //       classcode = json['classcode'],
  //       day = json['day'],
  //       time = json['time'];

  // factory Class.fromJson(Map<String, dynamic> json) {
  //   var list = json['classlist'] as List;

  //   return new Class.fromClass(
  //       id: json['id'],
  //       type: json['type'],
  //       priority: json['priority'],
  //       classcode: json['classcode'],
  //       day: json['day'].cast<int>(),
  //       time: json['time']
  //           .map<List<String>>((l) => List<String>.from(l))
  //           .toList());
  //   // .cast<List<String>>());
  // }
}
