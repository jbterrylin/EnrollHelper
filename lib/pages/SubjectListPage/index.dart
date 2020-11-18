import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectListPageMobx>(context, listen: false);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Observer(builder: (_) {
                  return Column(
                    children: <Widget>[
                      Column(children: state.listtiletfs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 32.0, bottom: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    state.toSubjectCreatePage();
                                  },
                                  child: Text('create class',
                                      style: state.appmobx.getTfStyle())))
                        ],
                      )
                    ],
                  );
                }))));
  }
}

class SubjectListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SubjectListPageMobx>(
      create: (context) => SubjectListPageMobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
