import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/api/model/Subjects.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/index.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
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
  ObservableList<Widget> listtiletfs = new ObservableList<Widget>();

  @action
  addPostFrameCallback() {
    loadSharedPrefs();
  }

  SubjectListPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    loadSharedPrefs();
  }

  loadSharedPrefs() async {
    SharedPref sharedPref = SharedPref();
    try {
      Subjects subjects = Subjects.fromJson(await sharedPref.read("subjects"));
      for (var subject in subjects.subjects) {
        listtiletfs.add(Container(
            margin: const EdgeInsets.only(top: 16.0),
            width: MediaQuery.of(context).size.width - 32,
            child: Row(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(subject.subjectcode,
                        style: appmobx.getSmallTileStyle()),
                    subtitle: Text(subject.subjectname,
                        style: appmobx.getSmallTileStyle()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ))
            ])));
      }
    } catch (Excepetion) {
      // do something
    }
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
