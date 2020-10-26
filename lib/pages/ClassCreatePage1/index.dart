import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassCreatePage1Mobx>(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Row(children: <Widget>[
                        Flexible(
                            child: TextField(
                          style: state.appmobx.getTfStyle(),
                          controller: state.subjectcodecontroller,
                          decoration: state.appmobx
                              .getTfDeco("subject code", "enter subject code"),
                        )),
                      ])),
                  Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Row(children: <Widget>[
                        Flexible(
                            child: TextField(
                          style: state.appmobx.getTfStyle(),
                          controller: state.subjectnamecontroller,
                          decoration: state.appmobx
                              .getTfDeco("subject name", "enter subject name"),
                        )),
                      ])),
                  Observer(builder: (_) {
                    return Column(
                      children: state.classtf,
                    );
                  }),
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
                                      borderRadius: BorderRadius.circular(16)),
                                  onPressed: () {
                                    state.nextPage();
                                  },
                                  child: Text('next',
                                      style: state.appmobx.getTfStyle())))
                        ],
                      ))
                ]))));
  }
}

class ClassCreatePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ClassCreatePage1Mobx>(
      create: (context) => ClassCreatePage1Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
