import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/ClassTfs/provider.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/DateTimeTfs/index.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
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
                        child: Observer(builder: (_) {
                          return TextField(
                            controller: state.prioritycontroller,
                            onChanged: (value) => state.setPriority(value),
                            keyboardType: TextInputType.number,
                            style: state.appmobx.getTfStyle(),
                            decoration: state.appmobx
                                .getTfDeco("priority", "enter priority"),
                          );
                        })))
              ])),
      Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(children: <Widget>[
            Flexible(
                child: TextField(
              controller: state.classcodecontroller,
              onChanged: (value) => {state.setClasscode(value)},
              style: state.appmobx.getTfStyle(),
              decoration:
                  state.appmobx.getTfDeco("class code", "enter class code"),
            )),
          ])),
      Container(child: Observer(builder: (_) {
        return Column(
          children: state.daytimetf,
        );
      })),
      Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () {
                    state.addDayTime();
                  },
                  child: Text('add time', style: state.appmobx.getTfStyle())),
              Observer(builder: (_) {
                return IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                );
              }),
            ],
          )),
    ]);
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
