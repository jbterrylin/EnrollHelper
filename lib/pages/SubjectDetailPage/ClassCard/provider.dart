import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Class.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class ClassCardMobx = ClassCardBase with _$ClassCardMobx;

abstract class ClassCardBase with Store {
  final BuildContext context;
  var appmobx;

  int index;

  Class classdata;

  @observable
  String connectedString;

  List<Widget> daytime;

  getdayTimeContent(classdata) {
    List<Widget> daytimecontent = List<Widget>();
    List wkdays = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

    for (int i = 0; i < classdata.days.length; i++) {
      daytimecontent.add(Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(wkdays[classdata.days[i].day - 1] +
              " " +
              classdata.days[i].time[0] +
              " - " +
              classdata.days[i].time[1]),
        ],
      ));
    }
    daytime = daytimecontent;
  }

  ClassCardBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    classdata = Provider.of<SubjectDetailPageMobx>(context, listen: false)
        .subject
        .classlist[index];

    connectedString = "connected: " +
        Provider.of<SubjectDetailPageMobx>(context, listen: false)
            .subject
            .connected
            .where((element) => element.contains(classdata.classcode))
            .expand((item) => item)
            .where((element) => element != classdata.classcode)
            .join(", ");

    if (connectedString == "connected: ") {
      connectedString += "none";
    }
    getdayTimeContent(classdata);
  }

  void dispose() {}
}
