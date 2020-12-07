import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedDd/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedTf/provider.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ConnectedDdMobx = ConnectedDdBase with _$ConnectedDdMobx;

abstract class ConnectedDdBase with Store {
  final BuildContext context;
  var appmobx;
  var subjectcreatepage2mobx;
  var connectedtfmobx;

  int connectedtfindex;
  int index;

  @observable
  ObservableList<DropdownMenuItem> dropdownItems =
      ObservableList<DropdownMenuItem>();

  @action
  setClass(String value) {
    debugPrint("aaa");
    debugPrint(value);
    debugPrint(subjectcreatepage2mobx.subject.connected[connectedtfindex].length
        .toString());
    subjectcreatepage2mobx.subject.connected[connectedtfindex][index] = value;
    if (value != "None" &&
        index ==
            subjectcreatepage2mobx.subject.connected[connectedtfindex].length -
                1) {
      connectedtfmobx.dropdowns.add(ConnectedDd(connectedtfindex, index + 1));
    }
  }

  ConnectedDdBase(this.context, this.connectedtfindex, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subjectcreatepage2mobx =
        Provider.of<SubjectCreatePage2Mobx>(context, listen: false);
    dropdownItems = subjectcreatepage2mobx.dropdownItems;
    subjectcreatepage2mobx.subject.connected[connectedtfindex]
        .add(dropdownItems[0].value);
    connectedtfmobx = Provider.of<ConnectedTfMobx>(context, listen: false);
  }

  void dispose() {}
}
