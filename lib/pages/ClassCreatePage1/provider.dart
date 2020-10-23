import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassCreatePage1Mobx = ClassCreatePage1Base with _$ClassCreatePage1Mobx;

abstract class ClassCreatePage1Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  String sentense;

  ClassCreatePage1Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  Future getSentense() async {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "lets start";
    else if (appmobx.language == "en") sentense = "让我们开始吧";
  }

  void dispose() {}
}
