import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage2/ConnectedDd/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int index;
  HomeWidget(this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ConnectedDdMobx>(context);

    return Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: DropdownButtonFormField(
          decoration: state.appmobx.getDropdownButtonFormFieldDeco(),
          value: state.dropdownItems[0].value ?? "None",
          isDense: true,
          onChanged: (value) {
            state.setClass(value);
          },
          items: state.dropdownItems.isNotEmpty
              ? state.dropdownItems
              : [
                  DropdownMenuItem(
                      child: Text(
                        "waiting...",
                        style: state.appmobx.getTfStyle(),
                      ),
                      value: state.dropdownItems[0].value ?? "None")
                ],
        ));
  }
}

class ConnectedDd extends StatelessWidget {
  final int connectedtfindex;
  final int index;
  ConnectedDd(this.connectedtfindex, this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<ConnectedDdMobx>(
      create: (context) => ConnectedDdMobx(context, connectedtfindex, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(index),
    );
  }
}
