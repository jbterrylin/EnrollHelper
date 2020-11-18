import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage2/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<RegisterPage2Mobx>(context);
    return Scaffold(
        body: state.appmobx.getSideMargin(
            context,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(
                          child: TextField(
                              controller: state.namecontroller,
                              style: state.appmobx.getTfStyle(),
                              decoration: state.appmobx
                                  .getTfDeco("name", "enter name", null)))
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        state.nextPage();
                      },
                      child: Text('next'),
                    ),
                  ],
                )
              ],
            )));
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
