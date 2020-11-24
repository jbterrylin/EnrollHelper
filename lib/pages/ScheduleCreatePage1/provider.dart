import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage1/SubjectCard/index.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage2/index.dart';
import 'package:flutter_mobx_cb/utils/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ScheduleCreatePage1Mobx = ScheduleCreatePage1Base
    with _$ScheduleCreatePage1Mobx;

abstract class ScheduleCreatePage1Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  List<Subject> subjects;

  @observable
  ObservableList<Widget> listtiletfs = new ObservableList<Widget>();

  @observable
  ObservableList<Widget> chips = ObservableList<Widget>();

  var chipnamelist = [
    "have sembahyang time",
    "lunch mummy boi",
    "fuck lunch gv me 8 hour straight",
    "4 day pls",
    "3 day pls",
    "study, break, study, break",
    "back home early",
    "back kampung early",
    "no 早操",
    "早操boi",
  ];

  @observable
  ObservableList<String> selectedchipname = ObservableList<String>();

  List<Subject> selectedsubject = List<Subject>();

  ScheduleCreatePage1Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    setChips();
    loadSharedPrefs();
  }

  @action
  setChips() {
    chips = ObservableList<Widget>();
    for (var chipname in chipnamelist) {
      chips.add(FilterChip(
          // avatar: CircleAvatar(
          //   backgroundColor: Colors.grey.shade800,
          //   child: Text('AB'),
          // ),
          label: Text(chipname),
          selected: selectedchipname.contains(chipname),
          onSelected: (bool value) {
            value
                ? selectedchipname.add(chipname)
                : selectedchipname.remove(chipname);
            setChips();
          }));
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
  setListtileTfs() {
    listtiletfs = new ObservableList<Widget>();
    subjects.sort((a, b) => a.favoriteliketime == null ? 1 : 0);
    subjects = [...subjects];
    for (int i = 0; i < subjects.length; i++) {
      listtiletfs.add(SubjectCard(i));
    }
  }

  nextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ScheduleCreatePage2(selectedsubject, selectedchipname);
    }));
  }

  void dispose() {}
}
