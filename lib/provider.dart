import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/service/http.dart';
import 'package:mobx/mobx.dart';

part 'provider.g.dart';

class AppMobx = AppBase with _$AppMobx;

abstract class AppBase with Store {
  final BuildContext context;
  HttpService http;

  @observable
  ThemeData theme;

  AppBase(this.context) {
    theme = ThemeData(primaryColor: Color.fromRGBO(43, 43, 43, 1));
    http = HttpService(context: this.context);
  }

  void dispose() {}
}
