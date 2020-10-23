import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassListPageMobx = ClassListPageBase with _$ClassListPageMobx;

abstract class ClassListPageBase with Store {
  final BuildContext context;
  var appmobx;

  @observable
  String sentense;

  ClassListPageBase(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  Future getSentense() async {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "class list";
    else if (appmobx.language == "en") sentense = "班列表";
  }

  void dispose() {}
}
