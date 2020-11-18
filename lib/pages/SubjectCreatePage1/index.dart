import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectCreatePage1Mobx>(context);

    return Scaffold(
        key: state.scaffoldkey,
        appBar: AppBar(
          title: Text(
            'enter class list',
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
                          Flexible(
                              child: TextField(
                            style: state.appmobx.getTfStyle(),
                            controller: state.subjectcodecontroller,
                            decoration: state.appmobx.getTfDeco(
                                "subject code",
                                "enter subject code",
                                state.subjectnameerrortext),
                          ))
                        ])),
                    Row(children: <Widget>[
                      Flexible(
                          child: TextField(
                        style: state.appmobx.getTfStyle(),
                        controller: state.subjectnamecontroller,
                        decoration: state.appmobx.getTfDeco("subject name",
                            "enter subject name", state.subjectnameerrortext),
                      )),
                    ]),
                    Column(
                      children: state.classtf,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: <Widget>[
                            RaisedButton(
                                onPressed: () {
                                  state.deleteLastClass();
                                },
                                child: Text('delete last class',
                                    style: state.appmobx.getTfStyle())),
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                                // width: MediaQuery.of(context).size.width -
                                //     32, // match_parent
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

class SubjectCreatePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SubjectCreatePage1Mobx>(
      create: (context) => SubjectCreatePage1Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
