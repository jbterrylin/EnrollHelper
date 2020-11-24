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

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );

      try {
        var subjects = await sharedPref.read("subjects");
        sharedPref.remove("subjects");
        sharedPref.save("subjects", [...subjects, subject]);
        debugPrint("aaaa");
      } catch (Exception) {
        sharedPref.save("subjects", [subject]);
      }
    } else if (whocall == "SubjectListPage") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  deleteSubject() async {
    try {
      SharedPref sharedPref = SharedPref();
      var temp = await sharedPref.read("subjects");
      List<Subject> subjects =
          temp.map<Subject>((i) => Subject.fromJson(i)).toList();
      subjects
          .removeWhere((element) => element.subjectname == subject.subjectname);

      sharedPref.remove("subjects");
      sharedPref.save("subjects", subjects);
    } catch (a) {
      debugPrint(a.toString());
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "subject inform";
    else if (appmobx.language == "en") sentense = "科目资料";
  }

  void dispose() {}
}
