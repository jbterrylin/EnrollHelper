import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedTf/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/index.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectCreatePage2Mobx = SubjectCreatePage2Base
    with _$SubjectCreatePage2Mobx;

abstract class SubjectCreatePage2Base with Store {
  final BuildContext context;
  var appmobx;

  Subject subject;

  @observable
  ObservableList<Widget> connectedtfs = ObservableList<Widget>();

  @observable
  String sentense;

  @action
  addConnectedTfs() {
    connectedtfs.add(ConnectedTf(connectedtfs.length));
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
      return SubjectDetailPage(subject, "SubjectCreatePage2");
    }));
  }

  SubjectCreatePage2Base(this.context, this.subject) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    getSentense();
    addConnectedTfs();
  }

  @action
  getSentense() {
    if (appmobx.language == "en" || appmobx.language == null)
      sentense = "enter connected class";
    else if (appmobx.language == "en") sentense = "输入关联的班级";
  }

  void dispose() {}
}
