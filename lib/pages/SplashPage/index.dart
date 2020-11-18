import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/MainPage/index.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 1),
      // () => Navigator.pushReplacementNamed(context, "/registerpage1"),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      ),
    );

    return Scaffold(
        body: Center(
      child: Text("Splash"),
    ));
  }
}
