import 'package:flutter_mobx_cb/api/model/Subject.dart';

class Subjects {
  Subjects({this.subjects});

  List<Subject> subjects;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subjects': subjects,
    };
  }

  factory Subjects.fromJson(Map<String, dynamic> json) {
    var list = json['subjects'] as List;
    // print(list.runtimeType); //returns List<dynamic>
    return Subjects(subjects: list.map((i) => Subject.fromJson(i)).toList());
  }
}
