import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedTfs/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int index;
  HomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ConnectedTfsMobx>(context);

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   state.addPostFrameCallback();
    // });

    return Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Observer(builder: (_) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DropdownButtonFormField(
                      decoration:
                          state.appmobx.getDropdownButtonFormFieldDeco(),
                      value: state.connected[0],
                      isDense: true,
                      onChanged: (value) {
                        state.setClass(value, 0);
                      },
                      items: state.dropdownItems.isNotEmpty
                          ? state.dropdownItems
                          : [
                              DropdownMenuItem(
                                  child: Text(
                                    "waiting...",
                                    style: state.appmobx.getTfStyle(),
                                  ),
                                  value: state.connected[0])
                            ],
                    )),
                Icon(
                  Icons.link,
                  // color: Colors.pink,
                  size: 32.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: DropdownButtonFormField(
                      decoration:
                          state.appmobx.getDropdownButtonFormFieldDeco(),
                      value: state.connected[1],
                      isDense: true,
                      onChanged: (value) {
                        state.setClass(value, 1);
                      },
                      items: state.dropdownItems.isNotEmpty
                          ? state.dropdownItems
                          : [
                              DropdownMenuItem(
                                  child: Text(
                                    "waiting...",
                                    style: state.appmobx.getTfStyle(),
                                  ),
                                  value: state.connected[0])
                            ],
                    )),
              ]);
        }));
  }
}

class ConnectedTfs extends StatelessWidget {
  final int index;
  ConnectedTfs(this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<ConnectedTfsMobx>(
      create: (context) => ConnectedTfsMobx(context, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(index),
    );
  }
}