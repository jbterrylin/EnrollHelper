import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class DateTimeTfsMobx = DateTimeTfsBase with _$DateTimeTfsMobx;

abstract class DateTimeTfsBase with Store {
  final BuildContext context;
  var appmobx;
  var SubjectCreatepage1mobx;

  int classindex;
  int index;
  int day;
  TextEditingController timecontroller;

  @action
  addPostFrameCallback() {
    day = SubjectCreatepage1mobx.classlist[classindex].day[index] ?? 1;
    timecontroller.text = SubjectCreatepage1mobx
        .classlist[classindex].time[index]
        .join('-')
        .toString()
        .replaceAll("TimeOfDay(", "")
        .replaceAll(")", "");
  }

  @action
  setDay(int value) {
    SubjectCreatepage1mobx.classlist[classindex].day[index] = value;
  }

  @action
  setTime(TimeOfDay start, TimeOfDay end) {
    SubjectCreatepage1mobx.classlist[classindex].time[index] = [
      start.toString(),
      end.toString()
    ];
    timecontroller.text = SubjectCreatepage1mobx
        .classlist[classindex].time[index]
        .join('-')
        .toString()
        .replaceAll("TimeOfDay(", "")
        .replaceAll(")", "");
  }

  DateTimeTfsBase(this.context, this.classindex, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    SubjectCreatepage1mobx =
        Provider.of<SubjectCreatePage1Mobx>(context, listen: false);
    timecontroller = TextEditingController();
  }

  void dispose() {
    timecontroller.dispose();
  }
}
