import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage1/provider.dart';
// import 'package:flutter_mobx_cb/pages/SubjectDetailPage/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectCardMobx = SubjectCardBase with _$SubjectCardMobx;

abstract class SubjectCardBase with Store {
  final BuildContext context;
  var appmobx;

  int index;

  Subject subject;

  @observable
  bool checkboxvalue;

  @observable
  Color favoritelikecolor;

  @action
  checkBoxOnChanged(bool value) {
    checkboxvalue = !checkboxvalue;
    Provider.of<ScheduleCreatePage1Mobx>(context, listen: false)
            .selectedsubject
            .contains(subject)
        ? Provider.of<ScheduleCreatePage1Mobx>(context, listen: false)
            .selectedsubject
            .remove(subject)
        : Provider.of<ScheduleCreatePage1Mobx>(context, listen: false)
            .selectedsubject
            .add(subject);
  }

  SubjectCardBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subject = Provider.of<ScheduleCreatePage1Mobx>(context, listen: false)
        .subjects[index];
    favoritelikecolor = subject.favoriteliketime == null ? null : Colors.red;
    checkboxvalue = false;
  }

  void dispose() {}
}
