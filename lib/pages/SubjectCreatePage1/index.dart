import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectCreatePage1Mobx>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tabs Demo',
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
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Flexible(
                              child: Text(
                            "create class",
                            style: state.appmobx.getTitleStyle(),
                          ))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(children: <Widget>[
                          Flexible(
                            child: TextField(
                                style: state.appmobx.getTfStyle(),
                                controller: state.subjectcodecontroller,
                                decoration: InputDecoration(
                                  labelStyle:
                                      new TextStyle(fontSize: 24, height: 0.7),
                                  labelText: "subject code",
                                  hintText: "enter subject code",
                                  errorText: state.subjectcodeerrortext,
                                  border: OutlineInputBorder(),
                                )
                                // decoration: state.appmobx.getTfDeco(
                                //     "subject code",
                                //     "enter subject code",
                                //     "this column should not be empty",
                                //     state.subjectcodevalid),
                                ),
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(children: <Widget>[
                          Flexible(
                              child: TextField(
                            style: state.appmobx.getTfStyle(),
                            controller: state.subjectnamecontroller,
                            decoration: state.appmobx.getTfDeco(
                                "subject name",
                                "enter subject name",
                                state.subjectnameerrortext),
                          )),
                        ])),
                    Column(
                      children: state.classtf,
                    ),
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
