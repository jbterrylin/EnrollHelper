import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedDd/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ConnectedTfMobx = ConnectedTfBase with _$ConnectedTfMobx;

abstract class ConnectedTfBase with Store {
  final BuildContext context;
  var appmobx;
  var subjectcreatepage2mobx;

  int index;

  @observable
  ObservableList<Widget> dropdowns = ObservableList<Widget>();

  @action
  setClass(String value, int dropdown) {
    subjectcreatepage2mobx.subject.connected[index][dropdown] = value;
  }

  ConnectedTfBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcreatepage2mobx =
        Provider.of<SubjectCreatePage2Mobx>(context, listen: false);
    subjectcreatepage2mobx.subject.connected.add(<String>[]);
    dropdowns.add(ConnectedDd(index, 0));
    dropdowns.add(ConnectedDd(index, 1));
  }

  // adddropdowns

  void dispose() {}
}
