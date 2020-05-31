import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/HomePage/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeMobx>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email: "),
              Observer(
                builder: (_) {
                  return Text(state.user?.email ?? "Loading ...");
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Gender: "),
              Observer(
                builder: (_) {
                  return Text(state.user?.gender ?? "Loading ...");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<HomeMobx>(
      create: (context) => HomeMobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
