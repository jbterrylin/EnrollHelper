import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage1/provider.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage2/index.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterPage1Mobx>(context);

    return GestureDetector(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return RegisterPage2();
      }));
    }, child: Scaffold(
      body: Observer(builder: (_) {
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
                        style: state.appmobx.getTitleStyle()),
                  ],
                )
              ],
            ));
      }),
    ));
  }
}

class RegisterPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RegisterPage1Mobx>(
      create: (context) => RegisterPage1Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
