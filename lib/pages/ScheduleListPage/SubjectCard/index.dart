import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectListPage/SubjectCard/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SubjectCardMobx>(context, listen: false);

    return GestureDetector(onTap: () {
      state.onTapNextPage();
    }, child: Observer(builder: (_) {
      return Container(
          margin: const EdgeInsets.only(top: 16.0),
          width: MediaQuery.of(context).size.width - 32,
          child: Row(children: <Widget>[
            Flexible(
                child: ListTile(
              leading: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: state.favoritelikecolor,
                  ),
                  onPressed: () {
                    state.favoriteOnPressed();
                  }),
              title: Text(state.subject.subjectcode,
                  style: state.appmobx.getSmallTileStyle()),
              subtitle: Text(state.subject.subjectname,
                  style: state.appmobx.getSmallTileStyle()),
              trailing: Icon(Icons.keyboard_arrow_right),
            ))
          ]));
    }));
  }
}

// ignore: must_be_immutable
class SubjectCard extends StatelessWidget {
  int index;
  SubjectCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<SubjectCardMobx>(
      create: (context) => SubjectCardMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
