import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class DateTimeTfsMobx = DateTimeTfsBase with _$DateTimeTfsMobx;

abstract class DateTimeTfsBase with Store {
  final BuildContext context;
  var appmobx;
  var classcreatepage1mobx;

  int classindex;
  int index;
  TextEditingController daycontroller;
  TextEditingController timecontroller;

  @action
  addPostFrameCallback() {
    daycontroller.text =
        classcreatepage1mobx.classlist[classindex].day[index].toString() ??
            1.toString();
    timecontroller.text =
        classcreatepage1mobx.classlist[classindex].time[index].toString() ??
            TimeOfDay.now().toString();
  }

  @action
  setDay(int value) {
    classcreatepage1mobx.classlist[classindex].day[index] = value;
  }

  @action
  setTime(TimeOfDay value) {
    debugPrint(value.toString());
    classcreatepage1mobx.classlist[classindex].time[index] = value;
  }

  DateTimeTfsBase(this.context, this.classindex, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classcreatepage1mobx =
        Provider.of<ClassCreatePage1Mobx>(context, listen: false);
    daycontroller = TextEditingController();
    timecontroller = TextEditingController();
  }

  void dispose() {
    daycontroller.dispose();
    timecontroller.dispose();
  }
}
