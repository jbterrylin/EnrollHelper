import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ScheduleCreatePage1/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ScheduleCreatePage1Mobx>(context);

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
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Wrap(
                                  spacing: 8.0, //主轴间距
                                  children: state.chips))
                        ])),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Row(
                            children: [Column(children: state.listtiletfs)])),
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

class ScheduleCreatePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ScheduleCreatePage1Mobx>(
      create: (context) => ScheduleCreatePage1Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
