import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage1/index.dart';
import 'package:flutter_mobx_cb/pages/ScheduleListPage/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx_cb/pages/MainPage/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/index.dart';

part 'provider.g.dart';

class MainPageMobx = MainPageBase with _$MainPageMobx;

abstract class MainPageBase with Store {
  final BuildContext context;
  var appmobx;

  @observable
  int currentIndex = 0;
  @observable
  String sentense;
  @observable
  String appbartitle;

  @observable
  ObservableMap<String, Widget> children = ObservableMap<String, Widget>();

  var tempWidget = [];

  final List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: new Icon(Icons.mail), label: 'Messages'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];

  MainPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    children["0"] = PlaceholderWidget(Colors.deepOrange);
    children["1"] = SubjectListPage();
    // children["2"] = ScheduleListPage();
    children["2"] = ScheduleCreatePage1();
  }

  @action
  changePage(String index, var shit) {
    if (index == "12") {
      tempWidget.add(children["1"]);
      children["1"] = SubjectCreatePage2(shit);
    }
    // currentIndex = int.parse(index);
  }

  @action
  onTabTapped(int index) {
    currentIndex = index;
    if (index == 0) {
      appbartitle = "favour";
    } else if (index == 1) {
      appbartitle = "class list";
    } else if (index == 2) {
      appbartitle = "schedule filter";
    }
  }

  void dispose() {}
}
