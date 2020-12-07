import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/EnrollCore/EnrollProcessor.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ScheduleCreatePage3Mobx = ScheduleCreatePage3Base
    with _$ScheduleCreatePage3Mobx;

abstract class ScheduleCreatePage3Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  List<String> selectedchipname = ObservableList<String>();

  List<Subject> selectedsubject = List<Subject>();

  @observable
  ObservableList<String> mustsubjectstrings = ObservableList<String>();

  @observable
  String nneededsubject;

  ScheduleCreatePage3Base(this.context, this.selectedsubject,
      this.selectedchipname, this.mustsubjectstrings, this.nneededsubject) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
  }

  nextPage() {
    var a = EnrollProcessor(
        selectedsubject, selectedchipname, mustsubjectstrings, nneededsubject);
    a.main();
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return SubjectCreatePage2(subject);
    // }));
  }

  void dispose() {}
}
