import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class TypeTfMobx = TypeTfBase with _$TypeTfMobx;

abstract class TypeTfBase with Store {
  final BuildContext context;
  var appmobx;
  var subjectcreatepage2mobx;

  int index;
  String type;

  TextEditingController nofneededcontroller;

  @action
  addPostFrameCallback() {
    // connected[0] = subjectcreatepage2mobx.subject.connected[index][0];
    // connected[1] = subjectcreatepage2mobx.subject.connected[index][1];
  }

  @action
  setNOfNeeded() {
    subjectcreatepage2mobx.subject.typelist[index][1] =
        nofneededcontroller.text;
  }

  TypeTfBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcreatepage2mobx =
        Provider.of<SubjectCreatePage2Mobx>(context, listen: false);
    type = subjectcreatepage2mobx.subject.typelist[index][0];
    nofneededcontroller = TextEditingController();
    nofneededcontroller.addListener(() {
      setNOfNeeded();
    });
    // connected[0] = dropdownItems[0].value;
    // connected[1] = dropdownItems[0].value;
  }

  void dispose() {}
}
