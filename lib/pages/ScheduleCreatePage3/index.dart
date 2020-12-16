import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage3/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ScheduleCreatePage3Mobx>(context);

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

// ignore: must_be_immutable
class ScheduleCreatePage3 extends StatelessWidget {
  List<Subject> selectedsubject;
  List<String> selectedchipname;
  List<String> mustsubjectstrings;
  String nneededsubject;

  ScheduleCreatePage3(this.selectedsubject, this.selectedchipname,
      this.mustsubjectstrings, this.nneededsubject);

  @override
  Widget build(BuildContext context) {
    return Provider<ScheduleCreatePage3Mobx>(
      create: (context) => ScheduleCreatePage3Mobx(context, selectedsubject,
          selectedchipname, mustsubjectstrings, nneededsubject),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
