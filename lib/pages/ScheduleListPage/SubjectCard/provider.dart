import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/pages/SubjectDetailPage/index.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/provider.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:provider/provider.dart';

part 'provider.g.dart';

class SubjectCardMobx = SubjectCardBase with _$SubjectCardMobx;

abstract class SubjectCardBase with Store {
  final BuildContext context;
  var appmobx;

  int index;

  Subject subject;

  @observable
  Color favoritelikecolor;

  onTapNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return SubjectDetailPage(subject, "SubjectListPage");
    }));
  }

  favoriteOnPressed() {
    favoritelikecolor = favoritelikecolor == Colors.red ? null : Colors.red;
    var temp = Provider.of<SubjectListPageMobx>(context, listen: false)
        .subjects[index]
        .favoriteliketime;
    Provider.of<SubjectListPageMobx>(context, listen: false)
        .subjects[index]
        .favoriteliketime = temp == null ? DateTime.now() : null;
    Provider.of<SubjectListPageMobx>(context, listen: false).setListtileTfs();
  }

  SubjectCardBase(this.context, this.index) {
    appmobx = Provider.of<AppMobx>(context, listen: false);
    subject = Provider.of<SubjectListPageMobx>(context, listen: false)
        .subjects[index];
    favoritelikecolor = subject.favoriteliketime == null ? null : Colors.red;
  }

  void dispose() {}
}
