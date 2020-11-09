import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassCreatePage3Mobx = ClassCreatePage3Base with _$ClassCreatePage3Mobx;

abstract class ClassCreatePage3Base with Store {
  final BuildContext context;
  var appmobx;

  Subject subject;

  @observable
  String sentense;

  ClassCreatePage3Base(this.context, this.subject) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  toClassCreatePage() async {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);

    SharedPref sharedPref = SharedPref();
    sharedPref.save("Subject", subject);
  }

  @action
  Future getSentense() async {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "subject inform";
    else if (appmobx.language == "en") sentense = "科目资料";
  }

  void dispose() {}
}
