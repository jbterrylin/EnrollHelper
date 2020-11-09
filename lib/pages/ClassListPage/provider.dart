import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/index.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassListPageMobx = ClassListPageBase with _$ClassListPageMobx;

abstract class ClassListPageBase with Store {
  final BuildContext context;
  var appmobx;

  String subjectname;

  @observable
  String sentense;

  @action
  addPostFrameCallback() {
    loadSharedPrefs();
  }

  ClassListPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    loadSharedPrefs();
  }

  loadSharedPrefs() async {
    SharedPref sharedPref = SharedPref();
    try {
      Subject subject = Subject.fromJson(await sharedPref.read("Subject"));
      subjectname = subject.subjectname;
    } catch (a) {
      // do something
    }
  }

  @action
  toClassCreatePage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ClassCreatePage1();
    }));
  }

  @action
  Future getSentense() async {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "class list";
    else if (appmobx.language == "en") sentense = "班列表";
  }

  void dispose() {}
}
