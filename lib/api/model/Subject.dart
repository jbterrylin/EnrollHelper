import 'package:flutter_mobx_cb/api/model/Class.dart';

class Subject {
  Subject();

  Subject.fromClass(
      {this.subjectcode,
      this.subjectname,
      this.classlist,
      this.connected,
      favoriteliketime});

  String subjectcode;
  String subjectname;
  List<Class> classlist;
  List<List<String>> connected = List<List<String>>();
  DateTime favoriteliketime;

  Map<String, dynamic> toJson() => {
        'subjectcode': subjectcode,
        'subjectname': subjectname,
        'classlist': classlist,
        'connected': connected,
        'favoriteliketime': favoriteliketime,
      };

  factory Subject.fromJson(Map<String, dynamic> json) {
    var list = json['classlist'] as List;
    // print(list.runtimeType); //returns List<dynamic>

    return Subject.fromClass(
        subjectcode: json['subjectcode'],
        subjectname: json['subjectname'],
        classlist: list.map((i) => Class.fromJson(i)).toList(),
        connected: json['connected']
            .map<List<String>>((l) => List<String>.from(l))
            .toList(),
        // .cast<List<String>>(),
        favoriteliketime: json['favoriteliketime']);
  }
}
