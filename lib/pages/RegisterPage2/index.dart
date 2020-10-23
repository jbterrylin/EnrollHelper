import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage2/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterPage2Mobx>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: new Flexible(
                      child: TextField(
                    style: state.appmobx.getTfStyle(),
                    decoration:
                        state.appmobx.getTfDeco("username", "enter username"),
                  )))
            ],
          )
        ],
      ),
    );
  }
}

class RegisterPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RegisterPage2Mobx>(
      create: (context) => RegisterPage2Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
