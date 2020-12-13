import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Day.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class DateTimeTfMobx = DateTimeTfBase with _$DateTimeTfMobx;

abstract class DateTimeTfBase with Store {
  final BuildContext context;
  var appmobx;
  var subjectcreatepage1mobx;

  int classindex;
  int index;
  int day;
  TextEditingController timecontroller;

  @action
  addPostFrameCallback() {
    // day = subjectcreatepage1mobx.classlist[classindex].day[index] ?? 1;
    // timecontroller.text =
    //     subjectcreatepage1mobx.classlist[classindex].time[index].join('-');
  }

  @action
  setDay(int value) {
    subjectcreatepage1mobx.classlist[classindex].day[index].day = value;
  }

  @action
  setTime(TimeOfDay start, TimeOfDay end) {
    subjectcreatepage1mobx.classlist[classindex].days[index].time = [
      start.format(context),
      end.format(context)
    ];
    timecontroller.text =
        subjectcreatepage1mobx.classlist[classindex].days[index].time.join('-');
  }

  DateTimeTfBase(this.context, this.classindex, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcreatepage1mobx =
        Provider.of<SubjectCreatePage1Mobx>(context, listen: false);

    timecontroller = TextEditingController();
    Future.delayed(Duration.zero, () {
      subjectcreatepage1mobx.classlist[classindex].days.add(Day(1, [
        TimeOfDay(hour: 0, minute: 0).format(context),
        TimeOfDay(hour: 0, minute: 0).format(context)
      ]));
      timecontroller.text = subjectcreatepage1mobx
          .classlist[classindex].days[index].time
          .join('-');
    });
  }

  void dispose() {
    timecontroller.dispose();
  }
}
