import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedTf/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int index;
  HomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ConnectedTfMobx>(context);

    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Observer(builder: (_) {
          return Row(children: <Widget>[
            Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    state.dropdowns.length >= 1 ? state.dropdowns[0] : null,
                    Icon(
                      Icons.link,
                      // color: Colors.pink,
                      size: 32.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    state.dropdowns.length >= 2 ? state.dropdowns[1] : null,
                  ]),
              Column(children: state.dropdowns.sublist(2)),
            ])
          ]);
        }));
  }
}

class ConnectedTf extends StatelessWidget {
  final int index;
  ConnectedTf(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<ConnectedTfMobx>(
      create: (context) => ConnectedTfMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(index),
    );
  }
}
