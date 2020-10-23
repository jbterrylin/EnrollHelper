import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/index.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/MainPage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  // final List<Widget> _children = [];

  final List<Widget> children = [
    PlaceholderWidget(Colors.deepOrange),
    ClassCreatePage1(),
    PlaceholderWidget(Colors.green)
  ];

  final List<BottomNavigationBarItem> icons = [
    BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: new Icon(Icons.mail), label: 'Messages'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
  ];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MainPageMobx>(context);

    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
                state.appbartitle == null ? "Loading..." : state.appbartitle),
          ),
          body: children[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: state.onTabTapped,
            currentIndex: state.currentIndex,
            items: icons,
          ),
        );
      },
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MainPageMobx>(
      create: (context) => MainPageMobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
