import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectDetailPageMobx>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            state.sentense != null ? state.sentense : "loading ...",
            style: state.appmobx.getTitleStyle(),
          ),
        ),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
              child: state.appmobx.getSideMargin(
                  context,
                  Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(state.subject.subjectcode ??
                                      "loading..."),
                                  subtitle: Text(state.subject.subjectname ??
                                      "loading..."),
                                ),
                              ],
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text("needed class for each type"),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 16.0, top: 4.0, bottom: 20.0),
                                    child: Row(children: <Widget>[
                                      Text(state.type ?? "loading...")
                                    ]))
                              ],
                            ),
                          )),
                      // Text(state.type ?? "loading...")
                      Column(children: state.classcards),
                      Container(
                          margin:
                              const EdgeInsets.only(top: 32.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  onPressed: () {
                                    state.nextPage();
                                  },
                                  child: Text(
                                      state.whocall == "SubjectCreatePage2"
                                          ? 'save'
                                          : "back",
                                      style: state.appmobx.getTfStyle())),
                              Visibility(
                                visible: state.whocall == "SubjectCreatePage2"
                                    ? false
                                    : true,
                                child: RaisedButton(
                                    onPressed: () {
                                      state.deleteSubject();
                                    },
                                    child: Text("delete",
                                        style: state.appmobx.getTfStyle())),
                              )
                            ],
                          ))
                    ],
                  )));
        }));
  }
}

class SubjectDetailPage extends StatelessWidget {
  final Subject subject;
  final String whocall;
  SubjectDetailPage(this.subject, this.whocall);

  @override
  Widget build(BuildContext context) {
    return Provider<SubjectDetailPageMobx>(
      create: (context) => SubjectDetailPageMobx(context, subject, whocall),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
