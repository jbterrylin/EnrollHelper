import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/DateTimeTfs/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassTfsMobx = ClassTfsBase with _$ClassTfsMobx;

abstract class ClassTfsBase with Store {
  final BuildContext context;
  var appmobx;
  var SubjectCreatepage1mobx;

  int index;
  bool createnewclassalr = false;

  TextEditingController prioritycontroller;
  @observable
  String classcodeerrortext;
  TextEditingController classcodecontroller;

  @observable
  ObservableList<Widget> classtf = new ObservableList<Widget>();
  @observable
  ObservableList<Widget> daytimetf = new ObservableList<Widget>();

  @action
  addPostFrameCallback() {
    prioritycontroller.text =
        SubjectCreatepage1mobx.classlist[index].priority.toString() ??
            99.toString();
    classcodecontroller.text =
        SubjectCreatepage1mobx.classlist[index].classcode ?? '';
  }

  @action
  setPriority() {
    if (prioritycontroller.text == null || prioritycontroller.text == "") {
      prioritycontroller.text = "99";
      SubjectCreatepage1mobx.classlist[index].priority = 99;
    } else {
      SubjectCreatepage1mobx.classlist[index].priority =
          int.parse(prioritycontroller.text);
    }
  }

  @action
  setClasscode() {
    SubjectCreatepage1mobx.classlist[index].classcode =
        classcodecontroller.text;
    if (classcodecontroller.text == "" || classcodecontroller.text == null) {
      classcodeerrortext = "this column should not be empty";
    } else {
      classcodeerrortext = null;
      if (SubjectCreatepage1mobx.classlist.length - 1 == index &&
          createnewclassalr == false) {
        SubjectCreatepage1mobx.classlist.add(Class(index + 1));
        SubjectCreatepage1mobx.addClassTf(index + 1);
        createnewclassalr = true;
      }
    }
  }

  @action
  addDayTime() {
    daytimetf.add(DateTimeTfs(index, daytimetf.length));
    SubjectCreatepage1mobx.classlist[index].day.add(1);
    SubjectCreatepage1mobx.classlist[index].time
        .add([TimeOfDay.now().toString(), TimeOfDay.now().toString()]);
  }

  @action
  deleteDayTime() {
    daytimetf.removeLast();
    SubjectCreatepage1mobx.classlist[index].day.removeLast();
    SubjectCreatepage1mobx.classlist[index].time.removeLast();
  }

  ClassTfsBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    SubjectCreatepage1mobx =
        Provider.of<SubjectCreatePage1Mobx>(context, listen: false);
    prioritycontroller = TextEditingController();
    prioritycontroller.addListener(() {
      setPriority();
    });
    classcodecontroller = TextEditingController();
    classcodecontroller.addListener(() {
      setClasscode();
    });
    addDayTime();
  }

  void dispose() {
    prioritycontroller.dispose();
    classcodecontroller.dispose();
  }
}
