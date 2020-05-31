import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/HomePage/index.dart';
import 'package:flutter_mobx_cb/provider.dart';
import 'package:flutter_mobx_cb/service/http.dart';
import 'package:provider/provider.dart';

import 'pages/SplashPage/index.dart';

void main() async {
  runApp(App());

  HttpService();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppMobx>(
      create: (_) => AppMobx(context),
      dispose: (_, mobx) => mobx.dispose(),
      child: Observer(
        builder: (context) {
          final state = Provider.of<AppMobx>(context);
          return MaterialApp(
            title: 'Bulter',
            theme: state.theme,
            home: SplashPage(),
            routes: {
              '/home': (_) => HomePage(),
            },
          );
        },
      ),
    );
  }
}
