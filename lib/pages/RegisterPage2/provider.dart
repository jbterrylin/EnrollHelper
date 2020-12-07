import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/User.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage3/index.dart';
import 'package:flutter_mobx_cb/utils/Storage.dart';
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

  bool confirmnamebeempty;
  TextEditingController namecontroller;

  Future comfirmName() async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('hello'),
          content: SingleChildScrollView(
              child: Text('Do you want to call lazy ass?')),
          actions: <Widget>[
            TextButton(
                child: Text('Approve'),
                onPressed: () {
                  confirmnamebeempty = true;
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('reject'),
                onPressed: () {
                  confirmnamebeempty = false;
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  @action
  nextPage() {
    SharedPref sharedPref = SharedPref();
    if (namecontroller.text.isEmpty) {
      confirmnamebeempty = false;
      comfirmName();
      if (confirmnamebeempty) {
        User user = User();
        user.name = "lazy ass";
        sharedPref.save("user", user);
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return RegisterPage3();
        }));
      }
    } else {
      User user = User();
      user.name = namecontroller.text;
      sharedPref.save("user", user);
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return RegisterPage3();
      }));
    }
  }

  RegisterPage2Base(this.context) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    namecontroller = TextEditingController();
  }

  void dispose() {
    namecontroller.dispose();
  }
}
