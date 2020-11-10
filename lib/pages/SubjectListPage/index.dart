import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectListPageMobx>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.addPostFrameCallback();
    });

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Observer(builder: (_) {
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  state.sentense != null
                                      ? state.sentense
                                      : "Loading ...",
                                  style: state.appmobx.getTitleStyle())
                            ],
                          )),
                      Column(children: state.listtiletfs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                              padding: EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {
                                state.toSubjectCreatePage();
                              },
                              child: Text('create class',
                                  style: state.appmobx.getTfStyle()))
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