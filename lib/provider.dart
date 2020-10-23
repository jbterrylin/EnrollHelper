import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/service/http.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/GlobalStyle.dart';

part 'provider.g.dart';

class AppMobx = AppBase with _$AppMobx;

abstract class AppBase extends GlobalStyle with Store {
  final BuildContext context;
  HttpService http;

  // @observable
  // ThemeData theme;
  @observable
  String language;

  AppBase(this.context) {
    // theme = ThemeData(primaryColor: Color.fromRGBO(43, 43, 43, 1));
    http = HttpService(context: this.context);
  }

  void dispose() {}
}
