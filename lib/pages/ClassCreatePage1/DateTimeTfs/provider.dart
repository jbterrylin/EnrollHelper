import 'package:flutter/material.dart';
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
  int day;
  TextEditingController timecontroller;

  @action
  addPostFrameCallback() {
    day = classcreatepage1mobx.classlist[classindex].day[index] ?? 1;
    timecontroller.text = classcreatepage1mobx.classlist[classindex].time[index]
        .join('-')
        .toString()
        .replaceAll("TimeOfDay(", "")
        .replaceAll(")", "");
  }

  @action
  setDay(int value) {
    classcreatepage1mobx.classlist[classindex].day[index] = value;
  }

  @action
  setTime(TimeOfDay start, TimeOfDay end) {
    classcreatepage1mobx.classlist[classindex].time[index] = [
      start.toString(),
      end.toString()
    ];
    timecontroller.text = classcreatepage1mobx.classlist[classindex].time[index]
        .join('-')
        .toString()
        .replaceAll("TimeOfDay(", "")
        .replaceAll(")", "");
  }

  DateTimeTfsBase(this.context, this.classindex, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classcreatepage1mobx =
        Provider.of<ClassCreatePage1Mobx>(context, listen: false);
    timecontroller = TextEditingController();
  }

  void dispose() {
    timecontroller.dispose();
  }
}
