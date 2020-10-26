import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/DateTimeTfs/index.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassTfsMobx = ClassTfsBase with _$ClassTfsMobx;

abstract class ClassTfsBase with Store {
  final BuildContext context;
  var appmobx;
  var classcreatepage1mobx;

  int index;
  TextEditingController prioritycontroller;
  TextEditingController classcodecontroller;

  @observable
  ObservableList<Widget> classtf = new ObservableList<Widget>();

  @observable
  ObservableList<Widget> daytimetf = new ObservableList<Widget>();

  @action
  addPostFrameCallback() {
    prioritycontroller.text =
        classcreatepage1mobx.classlist[index].priority.toString() ??
            1.toString();
    classcodecontroller.text =
        classcreatepage1mobx.classlist[index].classcode ?? '';
  }

  @action
  setPriority(String value) {
    classcreatepage1mobx.classlist[index].priority = int.parse(value);
  }

  @action
  setClasscode(String value) {
    classcreatepage1mobx.classlist[index].classcode = value;
    if (classcreatepage1mobx.classlist.length - 1 == index && value != '') {
      classcreatepage1mobx.classlist.add(Class(index + 1));
      classcreatepage1mobx.addClassTf(index + 1);
    }
  }

  @action
  addDayTime() {
    daytimetf.add(DateTimeTfs(index, daytimetf.length));
    classcreatepage1mobx.classlist[index].day.add(1);
    classcreatepage1mobx.classlist[index].time.add(TimeOfDay.now());
  }

  ClassTfsBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classcreatepage1mobx =
        Provider.of<ClassCreatePage1Mobx>(context, listen: false);
    prioritycontroller = TextEditingController();
    classcodecontroller = TextEditingController();
    addDayTime();
  }

  void dispose() {
    prioritycontroller.dispose();
    classcodecontroller.dispose();
  }
}
