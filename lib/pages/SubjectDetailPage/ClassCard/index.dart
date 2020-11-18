import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/ClassCard/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassCardMobx>(context, listen: false);

    return Container(
        margin: const EdgeInsets.only(top: 4.0),
        child: Observer(builder: (_) {
          return Row(children: <Widget>[
            Flexible(
                child: Card(
                    child: Column(children: <Widget>[
              ListTile(
                  title: Text(state.classdata.classcode),
                  subtitle: Text(state.connectedString ?? "loading..."),
                  trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(state.classdata.priority.toString())
                      ])),
              Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Row(children: <Widget>[
                    Row(children: <Widget>[Text("day   time")])
                  ])),
              Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 20.0),
                  child: Row(children: <Widget>[
                    Column(children: [
                      Row(children: <Widget>[Column(children: state.daytime)])
                    ])
                  ]))
            ])))
          ]);
        }));
  }
}

class ClassCard extends StatelessWidget {
  final int index;
  ClassCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<ClassCardMobx>(
      create: (context) => ClassCardMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
