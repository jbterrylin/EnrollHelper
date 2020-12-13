import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage3/index.dart';
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
  ObservableList<String> selectedchipname = ObservableList<String>();

  List<Subject> selectedsubject = List<Subject>();

  TextEditingController nneededsubjectcontroller;

  @observable
  ObservableList<Widget> mustsubjects = ObservableList<Widget>();

  @observable
  ObservableList<Widget> notmustsubjects = ObservableList<Widget>();

  @observable
  ObservableList<String> mustsubjectstrings = ObservableList<String>();

  ScheduleCreatePage2Base(
      this.context, this.selectedsubject, this.selectedchipname) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    nneededsubjectcontroller = TextEditingController();
    nneededsubjectcontroller.addListener(() {
      setNNeededSubject();
    });
    nneededsubjectcontroller.text = selectedsubject.length.toString();
    setsubjectchips();
    mustsubjects = ObservableList<Widget>();
  }

  @action
  setNNeededSubject() {
    if (nneededsubjectcontroller.text == null ||
        nneededsubjectcontroller.text == "") {
      nneededsubjectcontroller.text = selectedsubject.length.toString();
    }
  }

  @action
  setsubjectchips() {
    notmustsubjects = ObservableList<Widget>();
    mustsubjects = ObservableList<Widget>();
    selectedsubject.forEach((e) => mustsubjectstrings.contains(e.subjectcode)
        ? mustsubjects.add(Chip(
            label: Text(e.subjectcode),
            onDeleted: () {
              mustsubjectstrings.remove(e.subjectcode);
              setsubjectchips();
            },
          ))
        : notmustsubjects.add(Chip(
            label: Text(e.subjectcode),
            onDeleted: () {
              mustsubjectstrings.add(e.subjectcode);
              setsubjectchips();
            },
          )));
  }

  nextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ScheduleCreatePage3(selectedsubject, selectedchipname,
          mustsubjectstrings, nneededsubjectcontroller.text);
    }));
  }

  void dispose() {}
}
