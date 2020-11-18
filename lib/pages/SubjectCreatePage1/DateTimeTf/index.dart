import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/pages/SubjectCreatePage1/DateTimeTf/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  final int classindex;
  final int index;
  HomeWidget(this.classindex, this.index);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DateTimeTfMobx>(context);

    List<DropdownMenuItem> dropdownItems = [
      DropdownMenuItem(
          child: Text(
            "Mon",
            style: state.appmobx.getTfStyle(),
          ),
          value: 1),
      DropdownMenuItem(
          child: Text(
            "Tue",
            style: state.appmobx.getTfStyle(),
          ),
          value: 2),
      DropdownMenuItem(
          child: Text(
            "Wed",
            style: state.appmobx.getTfStyle(),
          ),
          value: 3),
      DropdownMenuItem(
          child: Text(
            "Thu",
            style: state.appmobx.getTfStyle(),
          ),
          value: 4),
      DropdownMenuItem(
          child: Text(
            "Fri",
            style: state.appmobx.getTfStyle(),
          ),
          value: 5),
      DropdownMenuItem(
          child: Text(
            "Sat",
            style: state.appmobx.getTfStyle(),
          ),
          value: 6),
      DropdownMenuItem(
          child: Text(
            "Sun",
            style: state.appmobx.getTfStyle(),
          ),
          value: 7),
    ];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.addPostFrameCallback();
    });

    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: DropdownButtonFormField(
                    decoration: state.appmobx.getDropdownButtonFormFieldDeco(),
                    value: state.day ?? 1,
                    isDense: true,
                    onChanged: (value) {
                      state.setDay(value);
                    },
                    items: dropdownItems,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.59,
                  child: TextField(
                      style: state.appmobx.getTfStyle(),
                      decoration: state.appmobx.getTfDeco(null, null, null),
                      controller: state.timecontroller,
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay start = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child,
                            );
                          },
                        );
                        if (start != null) {
                          TimeOfDay end = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child,
                              );
                            },
                          );
                          if (end != null) {
                            state.setTime(start, end);
                          }
                        }
                      })),
            ]));
  }
}

class DateTimeTfs extends StatelessWidget {
  final int classindex;
  final int index;
  DateTimeTfs(this.classindex, this.index);

  @override
  Widget build(BuildContext context) {
    return Provider<DateTimeTfMobx>(
      create: (context) => DateTimeTfMobx(context, classindex, index),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(classindex, index),
    );
  }
}
