import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/DateTimeTf/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassTfMobx = ClassTfBase with _$ClassTfMobx;

abstract class ClassTfBase with Store {
  final BuildContext context;
  var appmobx;
  var subjectcreatepage1mobx;

  @observable
  int index;

  TextEditingController typecontroller;

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
        subjectcreatepage1mobx.classlist[index].priority.toString() ??
            99.toString();
    classcodecontroller.text =
        subjectcreatepage1mobx.classlist[index].classcode ?? '';
  }

  @action
  setType() {
    subjectcreatepage1mobx.classlist[index].type = typecontroller.text;
  }

  @action
  setPriority() {
    if (prioritycontroller.text == null || prioritycontroller.text == "") {
      prioritycontroller.text = "99";
      subjectcreatepage1mobx.classlist[index].priority = 99;
    } else {
      subjectcreatepage1mobx.classlist[index].priority =
          int.parse(prioritycontroller.text);
    }
  }

  @action
  setClasscode() {
    subjectcreatepage1mobx.classlist[index].classcode =
        classcodecontroller.text;
    if (classcodecontroller.text == "" || classcodecontroller.text == null) {
      classcodeerrortext = "this column should not be empty";
    } else {
      classcodeerrortext = null;
      if (subjectcreatepage1mobx.classlist.length - 1 == index) {
        subjectcreatepage1mobx.classlist.add(Class(index + 1));
        subjectcreatepage1mobx.addClassTf(index + 1);
      }
    }
  }

  @action
  addDayTime() {
    daytimetf.add(DateTimeTfs(index, daytimetf.length));
  }

  @action
  deleteDayTime() {
    if (daytimetf.length > 0) {
      daytimetf.removeLast();
      subjectcreatepage1mobx.classlist[index].days.removeLast();
    }
  }

  ClassTfBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcreatepage1mobx =
        Provider.of<SubjectCreatePage1Mobx>(context, listen: false);
    typecontroller = TextEditingController();
    typecontroller.addListener(() {
      setType();
    });
    prioritycontroller = TextEditingController();
    prioritycontroller.addListener(() {
      setPriority();
    });
    classcodecontroller = TextEditingController();
    classcodecontroller.addListener(() {
      setClasscode();
    });
  }

  void dispose() {
    prioritycontroller.dispose();
    classcodecontroller.dispose();
  }
}
