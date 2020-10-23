import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class RegisterPage2Mobx = RegisterPage2Base with _$RegisterPage2Mobx;

abstract class RegisterPage2Base with Store {
  final BuildContext context;
  var appmobx;

  @observable
  String sentense;

  RegisterPage2Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
  }

  void dispose() {}
}
