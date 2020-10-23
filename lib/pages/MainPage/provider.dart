import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

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

  MainPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
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
    debugPrint('cureent $currentIndex');
  }

  void dispose() {}
}
