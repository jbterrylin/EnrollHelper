import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class RegisterPage3Mobx = RegisterPage3Base with _$RegisterPage3Mobx;

abstract class RegisterPage3Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  String sentense;

  RegisterPage3Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "lets start";
    else if (appmobx.language == "en") sentense = "让我们开始吧";
  }

  void dispose() {}
}
