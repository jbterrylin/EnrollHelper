import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage2/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassCreatePage2Mobx>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Connected',
            // style: state.appmobx.getTitleStyle(),
          ),
        ),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(children: <Widget>[
                          Text(
                              state.sentense != null
                                  ? state.sentense
                                  : "Loading ...",
                              style: state.appmobx.getTitleStyle()),
                        ])),
                    Column(
                      children: state.connectedtfs,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: <Widget>[
                            RaisedButton(
                                padding: EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                onPressed: () {
                                  state.addConnectedTfs();
                                },
                                child: Text('add',
                                    style: state.appmobx.getTfStyle())),
                            Container(
                              margin: const EdgeInsets.only(left: 16.0),
                              child: RaisedButton(
                                  padding: EdgeInsets.all(16.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  onPressed: () {
                                    state.deleteConnectedTfs();
                                  },
                                  child: Text('delete time',
                                      style: state.appmobx.getTfStyle())),
                            )
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 32.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    32, // match_parent
                                child: RaisedButton(
                                    padding: EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
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

class ClassCreatePage2 extends StatelessWidget {
  final Subject subject;
  ClassCreatePage2(this.subject);

  @override
  Widget build(BuildContext context) {
    return Provider<ClassCreatePage2Mobx>(
      create: (context) => ClassCreatePage2Mobx(context, subject),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
