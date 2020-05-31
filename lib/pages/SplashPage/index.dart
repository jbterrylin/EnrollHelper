import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, "/home"),
    );

    return Scaffold(
        body: Center(
      child: Text("Splash"),
    ));
  }
}
