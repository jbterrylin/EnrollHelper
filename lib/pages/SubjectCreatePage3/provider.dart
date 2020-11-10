import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/api/model/Subjects.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectCreatePage3Mobx = SubjectCreatePage3Base
    with _$SubjectCreatePage3Mobx;

abstract class SubjectCreatePage3Base with Store {
  final BuildContext context;
  var appmobx;

  Subject subject;

  @observable
  String sentense;

  SubjectCreatePage3Base(this.context, this.subject) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  toSubjectCreatePage() async {
    SharedPref sharedPref = SharedPref();
    try {
      Subjects subjects = Subjects.fromJson(await sharedPref.read("subjects"));
      subjects.subjects.add(subject);
    } catch (Excepetion) {
      sharedPref.save("subjects", Subjects(subjects: [subject]));
    }

    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @action
  Future getSentense() async {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "subject inform";
    else if (appmobx.language == "en") sentense = "科目资料";
  }

  void dispose() {}
}
