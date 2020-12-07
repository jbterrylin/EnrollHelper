import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/SubjectCard/index.dart';
import 'package:flutter_mobx_cb/utils/Storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectListPageMobx = SubjectListPageBase with _$SubjectListPageMobx;

abstract class SubjectListPageBase with Store {
  final BuildContext context;
  var appmobx;

  String subjectname;

  @observable
  String sentense;
  @observable
  List<Subject> subjects;

  @observable
  ObservableList<Widget> listtiletfs = new ObservableList<Widget>();

  SubjectListPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    loadSharedPrefs();
  }

  @action
  setListtileTfs() {
    // var listtiletfs = new ObservableList<Widget>();
    subjects.sort((a, b) => a.favoriteliketime == null ? 1 : 0);
    subjects = [...subjects];
    for (int i = 0; i < subjects.length; i++) {
      listtiletfs.add(SubjectCard(i));
    }
  }

  loadSharedPrefs() async {
    SharedPref sharedPref = SharedPref();
    try {
      var temp = await sharedPref.read("subjects");
      subjects = temp.map<Subject>((i) => Subject.fromJson(i)).toList();
      setListtileTfs();
      // } catch (Excepetion) {
    } catch (a) {
      // do something
      debugPrint(a.toString());
    }
  }

  @action
  addPostFrameCallback() {
    loadSharedPrefs();
  }

  @action
  toSubjectCreatePage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SubjectCreatePage1();
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
