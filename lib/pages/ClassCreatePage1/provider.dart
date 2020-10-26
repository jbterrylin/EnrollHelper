import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/ClassTfs/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassCreatePage1Mobx = ClassCreatePage1Base with _$ClassCreatePage1Mobx;

abstract class ClassCreatePage1Base with Store {
  final BuildContext context;
  var appmobx;

  final classkey = GlobalKey<FormState>();
  TextEditingController classController;
  @observable
  ObservableList<Class> classlist = new ObservableList<Class>();
  @observable
  ObservableList<Widget> classtf = new ObservableList<Widget>();

  TextEditingController subjectcodecontroller;
  TextEditingController subjectnamecontroller;

  @action
  addClassTf(int index) {
    classtf.add(ClassTfs(index));
  }

  ClassCreatePage1Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classlist.add(Class(0));
    addClassTf(0);
  }

  nextPage() {
    Subject subject = new Subject();
    subject.subjectcode = subjectcodecontroller.text;
    subject.subjectname = subjectnamecontroller.text;
    subject.classlist = classlist;
  }

  void dispose() {
    // classController.dispose();
  }
}
