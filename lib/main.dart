import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/RegisterPage1/index.dart';
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
          // final state = Provider.of<AppMobx>(context);
          return MaterialApp(
            title: '69 helper',
            // theme: state.theme,
            theme: ThemeData(
              brightness: Brightness.dark,
              /* light theme settings */
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            home: SplashPage(),
            routes: {
              '/registerpage1': (_) => RegisterPage1(),
            },
          );
        },
      ),
    );
  }
}
