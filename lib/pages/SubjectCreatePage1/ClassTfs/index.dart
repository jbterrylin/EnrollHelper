import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/ClassTfs/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int index;
  HomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassTfsMobx>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.addPostFrameCallback();
    });

    return Observer(builder: (_) {
      return Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 32.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "class " + (index + 1).toString(),
                    style: state.appmobx.getTitleStyle(),
                  ),
                  Flexible(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: TextField(
                            controller: state.prioritycontroller,
                            keyboardType: TextInputType.number,
                            style: state.appmobx.getTfStyle(),
                            decoration: state.appmobx
                                .getTfDeco("priority", "enter priority", null),
                          )))
                ])),
        Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(children: <Widget>[
              Flexible(
                  child: TextField(
                controller: state.classcodecontroller,
                style: state.appmobx.getTfStyle(),
                decoration: state.appmobx.getTfDeco(
                    "class code", "enter class code", state.classcodeerrortext),
              )),
            ])),
        Container(
            child: Column(
          children: state.daytimetf,
        )),
        Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    onPressed: () {
                      state.addDayTime();
                    },
                    child: Text('add time', style: state.appmobx.getTfStyle())),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: RaisedButton(
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: () {
                        state.deleteDayTime();
                      },
                      child: Text('delete time',
                          style: state.appmobx.getTfStyle())),
                )
              ],
            )),
      ]);
    });
  }
}

class ClassTfs extends StatelessWidget {
  final int index;
  ClassTfs(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<ClassTfsMobx>(
      create: (context) => ClassTfsMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(index),
    );
  }
}
