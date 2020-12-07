import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/TypeTf/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int index;
  HomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<TypeTfMobx>(context);

    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Observer(builder: (_) {
          return Row(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  state.type,
                  style: state.appmobx.getTitleStyle(),
                )),
            Container(
                child: Flexible(
                    child: TextField(
              style: state.appmobx.getTfStyle(),
              controller: state.nofneededcontroller,
              keyboardType: TextInputType.number,
              decoration: state.appmobx
                  .getTfDeco("n of needed", "enter n of needed", null),
            ))),
          ]);
        }));
  }
}

class TypeTf extends StatelessWidget {
  final int index;
  TypeTf(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<TypeTfMobx>(
      create: (context) => TypeTfMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(index),
    );
  }
}
