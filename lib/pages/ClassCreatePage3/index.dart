import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage3/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassCreatePage3Mobx>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Connected',
            // style: state.appmobx.getTitleStyle(),
          ),
        ),
        body: Scaffold(body: Observer(builder: (_) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(state.sentense != null ? state.sentense : "Loading ...",
                      style: state.appmobx.getTitleStyle())
                ],
              ),
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
                      child: Text('save', style: state.appmobx.getTfStyle()))
                ],
              )
            ],
          );
        })));
  }
}

class ClassCreatePage3 extends StatelessWidget {
  final Subject subject;
  ClassCreatePage3(this.subject);

  @override
  Widget build(BuildContext context) {
    return Provider<ClassCreatePage3Mobx>(
      create: (context) => ClassCreatePage3Mobx(context, subject),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
