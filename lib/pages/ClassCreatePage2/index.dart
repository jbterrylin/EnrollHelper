import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassListPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassListPageMobx>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return Text(
                      state.sentense != null ? state.sentense : "Loading ...",
                      style: state.appmobx.getTitleStyle());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ClassListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ClassListPageMobx>(
      create: (context) => ClassListPageMobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
