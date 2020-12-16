import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/MainPage/index.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage3/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterPage3Mobx>(context);

    return GestureDetector(onTap: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (Route<dynamic> route) => false,
      );
    }, child: Scaffold(body: Observer(builder: (_) {
      return state.appmobx.getSideMargin(
          context,
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        state.sentense != null ? state.sentense : "loading ...",
                        style: state.appmobx.getTitleStyle())
                  ],
                )
              ]));
    })));
  }
}

class RegisterPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RegisterPage3Mobx>(
      create: (context) => RegisterPage3Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
