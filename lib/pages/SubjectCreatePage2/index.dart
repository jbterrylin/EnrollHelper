import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectCreatePage2Mobx>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            state.sentense != null ? state.sentense : "Loading ...",
            style: state.appmobx.getTitleStyle(),
          ),
        ),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
              child: state.appmobx.getSideMargin(
                  context,
                  Column(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Text(
                            "each type's needed n",
                            style: state.appmobx.getTitleStyle(),
                          )
                        ])),
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                          child: Column(
                        children: state.typetfs,
                      )),
                    ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Text(
                            "connected",
                            style: state.appmobx.getTitleStyle(),
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Column(
                            children: state.connectedtfs,
                          )),
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: <Widget>[
                            RaisedButton(
                                onPressed: () {
                                  state.addConnectedTfs();
                                },
                                child: Text('add connected',
                                    style: state.appmobx.getTfStyle())),
                            Container(
                              margin: const EdgeInsets.only(left: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    state.deleteConnectedTfs();
                                  },
                                  child: Text('delete connected',
                                      style: state.appmobx.getTfStyle())),
                            )
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    32, // match_parent
                                child: RaisedButton(
                                    onPressed: () {
                                      state.nextPage();
                                    },
                                    child: Text('next',
                                        style: state.appmobx.getTfStyle())))
                          ],
                        ))
                  ])));
        }));
  }
}

class SubjectCreatePage2 extends StatelessWidget {
  final Subject subject;
  SubjectCreatePage2(this.subject);

  @override
  Widget build(BuildContext context) {
    return Provider<SubjectCreatePage2Mobx>(
      create: (context) => SubjectCreatePage2Mobx(context, subject),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
