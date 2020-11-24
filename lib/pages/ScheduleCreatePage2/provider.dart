import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ScheduleCreatePage2Mobx = ScheduleCreatePage2Base
    with _$ScheduleCreatePage2Mobx;

abstract class ScheduleCreatePage2Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  List<String> selectedchipname = ObservableList<String>();

  List<Subject> selectedsubject = List<Subject>();

  ScheduleCreatePage2Base(
      this.context, this.selectedsubject, this.selectedchipname) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
  }

  nextPage() {
    debugPrint(selectedchipname.length.toString());
    debugPrint(selectedsubject.length.toString());
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return SubjectCreatePage2(subject);
    // }));
  }

  void dispose() {}
}
