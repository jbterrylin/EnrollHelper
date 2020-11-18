// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_mobx_cb/pages/ExamplePage/provider.dart';
// import 'package:provider/provider.dart';

// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final state = Provider.of<ExamplePageMobx>(context);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Email: "),
//               Observer(
//                 builder: (_) {
//                   return Text(state.user?.email ?? "Loading ...");
//                 },
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Gender: "),
//               Observer(
//                 builder: (_) {
//                   return Text(state.user?.gender ?? "Loading ...");
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExamplePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<ExamplePageMobx>(
//       create: (context) => ExamplePageMobx(context),
//       dispose: (_, state) => state.dispose(),
//       child: HomeWidget(),
//     );
//   }
// }
