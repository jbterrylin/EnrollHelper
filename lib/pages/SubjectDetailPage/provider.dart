import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/MainPage/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/ClassCard/index.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectDetailPageMobx = SubjectDetailPageBase
    with _$SubjectDetailPageMobx;

abstract class SubjectDetailPageBase with Store {
  final BuildContext context;
  var appmobx;

  String whocall;
  Subject subject;
  List<Widget> classcards = List<Widget>();

  @observable
  String sentense;

  SubjectDetailPageBase(this.context, this.subject, this.whocall) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    for (int i = 0; i < subject.classlist.length; i++) {
      classcards.add(ClassCard(i));
    }
  }

  @action
  nextPage() async {
    if (whocall == "SubjectCreatePage2") {
      SharedPref sharedPref = SharedPref();
      try {
        var subjects = await sharedPref.read("subjects");
        sharedPref.remove("subjects");
        sharedPref.save("subjects", [...subjects, subject]);
      } catch (Excepetion) {
        sharedPref.save("subjects", [subject]);
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );
    } else if (whocall == "SubjectListPage") {
      Navigator.pop(context);
    }
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "subject inform";
    else if (appmobx.language == "en") sentense = "科目资料";
  }

  void dispose() {}
}
