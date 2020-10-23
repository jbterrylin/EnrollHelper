import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/get_profile.dart';
import 'package:flutter_mobx_cb/api/model/user.dart';
import 'package:flutter_mobx_cb/service/http.dart';
import 'package:mobx/mobx.dart';

part 'provider.g.dart';

class ExamplePageMobx = ExamplePageBase with _$ExamplePageMobx;

abstract class ExamplePageBase with Store {
  final BuildContext context;
  HttpService http;

  @observable
  User user;

  ExamplePageBase(this.context) {
    http = HttpService(context: this.context);

    getUser();
  }

  @action
  Future getUser() async {
    var request = GetProfileRequest();
    var response = await http.request(request);
    var result = GetProfileResponse.fromJson(response.data);

    user = result.results[0];
  }

  void dispose() {}
}
