import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class RegisterPage1Mobx = RegisterPage1Base with _$RegisterPage1Mobx;

abstract class RegisterPage1Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  String sentense;

  RegisterPage1Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense =
          "hello, my boi / gurl.\nbefore start to use this app,\nplease give me ur name.";
    else if (appmobx.language == "en") sentense = "您好，老铁.\n在使用之前，\n帮我填个名字吧";
  }

  void dispose() {}
}
