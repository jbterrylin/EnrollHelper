import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';

class ClassEnroll {
  String subjectcode;
  String subjectname;
  List<List<String>> connected = List<List<String>>();
  // List<List<String>> connected = List<List<String>>(); // classcode
  // List<List<String>> typelist = List<List<String>>();

  String type;
  int priority;
  String classcode;
  List<int> day = new List();
  List<List<String>> time = new List();

  ClassEnroll(Subject subject, Class classdata) {
    subjectcode = subject.subjectcode;
    subjectname = subject.subjectname;
    connected.addAll(subject.connected
        .where((element) => element.contains(classdata.classcode)));

    type = classdata.type;
    priority = classdata.priority;
    classcode = classdata.classcode;
    // day = classdata.day;
    // time = classdata.time;
  }
}
