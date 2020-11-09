import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassListPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassListPageMobx>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.addPostFrameCallback();
    });

    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Observer(builder: (_) {
                  return Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  state.sentense != null
                                      ? state.sentense
                                      : "Loading ...",
                                  style: state.appmobx.getTitleStyle())
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          width: MediaQuery.of(context).size.width - 32,
                          child: Row(children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width - 32,
                                child: ListTile(
                                  leading: Icon(Icons.home),
                                  title: Text('Horse',
                                      style: state.appmobx.getSmallTileStyle()),
                                  subtitle: Text('A strong animal',
                                      style: state.appmobx.getSmallTileStyle()),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ))
                          ])),
                      Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          width: MediaQuery.of(context).size.width - 32,
                          child: Row(children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width - 32,
                                child: ListTile(
                                  leading: Icon(Icons.home),
                                  title: Text('Horse',
                                      style: state.appmobx.getSmallTileStyle()),
                                  subtitle: Text('A strong animal',
                                      style: state.appmobx.getSmallTileStyle()),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                ))
                          ])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                              padding: EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {
                                state.toClassCreatePage();
                              },
                              child: Text('create class',
                                  style: state.appmobx.getTfStyle()))
                        ],
                      )
                    ],
                  );
                }))));
  }
}

class ClassListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ClassListPageMobx>(
      create: (context) => ClassListPageMobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
