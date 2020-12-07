import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage2/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ScheduleCreatePage2Mobx>(context);

    return Scaffold(
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
                        child: Row(children: [
                          Flexible(
                              child: Container(
                                  child: TextField(
                                      controller:
                                          state.nneededsubjectcontroller,
                                      keyboardType: TextInputType.number,
                                      style: state.appmobx.getTfStyle(),
                                      decoration: state.appmobx.getTfDeco(
                                          "total needed subject",
                                          "enter total needed subject",
                                          null))))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Text(
                            "must subjects",
                            style: state.appmobx.getTitleStyle(),
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Wrap(
                                  spacing: 8.0, //主轴间距
                                  children: state.mustsubjects))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Text(
                            "not must subjects",
                            style: state.appmobx.getTitleStyle(),
                          )
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Wrap(
                                  spacing: 8.0, //主轴间距
                                  children: state.notmustsubjects))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                        child: Row(
                          children: [
                            Expanded(
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

class ScheduleCreatePage2 extends StatelessWidget {
  List<Subject> selectedsubject;
  List<String> selectedchipname;

  ScheduleCreatePage2(this.selectedsubject, this.selectedchipname);

  @override
  Widget build(BuildContext context) {
    return Provider<ScheduleCreatePage2Mobx>(
      create: (context) =>
          ScheduleCreatePage2Mobx(context, selectedsubject, selectedchipname),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
