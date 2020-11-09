import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage2/ConnectedTfs/index.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage3/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassCreatePage2Mobx = ClassCreatePage2Base with _$ClassCreatePage2Mobx;

abstract class ClassCreatePage2Base with Store {
  final BuildContext context;
  var appmobx;

  Subject subject;

  @observable
  ObservableList<Widget> connectedtfs = ObservableList<Widget>();

  @observable
  String sentense;

  @action
  addConnectedTfs() {
    connectedtfs.add(ConnectedTfs(connectedtfs.length));
    var reservevalue = subject.classlist.map((e) => e.classcode).toList()[0];
    subject.connected.add([reservevalue, reservevalue]);
  }

  @action
  deleteConnectedTfs() {
    connectedtfs.removeLast();
    subject.connected.removeLast();
  }

  nextPage() {
    // subject.connected.forEach((element) {
    //   if (element[0] == element[1]) {
    //     final snackBar = new SnackBar(
    //       content: new Text("don't put 2 same class as connected."),
    //       behavior: SnackBarBehavior.floating,
    //     );
    //     Scaffold.of(context).showSnackBar(snackBar);
    //     return;
    //   }
    // });
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ClassCreatePage3(this.subject);
    }));
  }

  ClassCreatePage2Base(this.context, this.subject) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    addConnectedTfs();
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "connected";
    else if (appmobx.language == "en") sentense = "关联的班级";
  }

  void dispose() {}
}
