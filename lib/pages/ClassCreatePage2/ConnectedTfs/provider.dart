import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage2/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ConnectedTfsMobx = ConnectedTfsBase with _$ConnectedTfsMobx;

abstract class ConnectedTfsBase with Store {
  final BuildContext context;
  var appmobx;
  var classcreatepage2mobx;

  int index;
  var connected = new List(2);

  @observable
  ObservableList<DropdownMenuItem> dropdownItems =
      ObservableList<DropdownMenuItem>();

  @action
  addPostFrameCallback() {
    connected[0] = classcreatepage2mobx.subject.connected[index][0];
    connected[1] = classcreatepage2mobx.subject.connected[index][1];
  }

  @action
  setClass(String value, int dropdown) {
    classcreatepage2mobx.subject.connected[index][dropdown] = value;
  }

  ConnectedTfsBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classcreatepage2mobx =
        Provider.of<ClassCreatePage2Mobx>(context, listen: false);
    classcreatepage2mobx.subject.classlist
        .map((e) => e.classcode)
        .toList()
        .forEach((element) {
      dropdownItems.add(DropdownMenuItem(
          child: Text(element, style: appmobx.getTfStyle()), value: element));
    });
    connected[0] = dropdownItems[0].value;
    connected[1] = dropdownItems[0].value;
  }

  void dispose() {}
}
