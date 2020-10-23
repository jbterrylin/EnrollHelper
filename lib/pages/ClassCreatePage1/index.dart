import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/DropDownItem.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_cb/pages/ClassCreatePage1/provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ClassCreatePage1Mobx>(context, listen: false);

    final List<DropdownMenuItem> dropdownItems = [
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

    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Flexible(
                    child: TextField(
                  style: state.appmobx.getTfStyle(),
                  decoration: state.appmobx
                      .getTfDeco("lecture code", "enter lecture code"),
                )),
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                      style: state.appmobx.getTfStyle(),
                      decoration: state.appmobx
                          .getTfDeco("lecture code", "enter lecture code"),
                    )),
                  ])),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "class 1",
                          style: state.appmobx.getTitleStyle(),
                        ),
                        Flexible(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: state.appmobx.getTfStyle(),
                                  decoration: state.appmobx
                                      .getTfDeco("priority", "enter priority"),
                                )))
                      ])),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                      style: state.appmobx.getTfStyle(),
                      decoration: state.appmobx
                          .getTfDeco("class code", "enter class code"),
                    )),
                  ])),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: InputDecorator(
                      decoration: InputDecoration(
                          // labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: dropdownItems.length == 0,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: 1,
                          isDense: true,
                          onChanged: (value) {
                            // setState(() {
                            //   _currentSelectedValue = newValue;
                            //   state.didChange(newValue);
                            // });
                          },
                          items: dropdownItems,
                        ),
                      ))),
            ])));
  }
}

class ClassCreatePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ClassCreatePage1Mobx>(
      create: (context) => ClassCreatePage1Mobx(context),
      dispose: (_, state) => state.dispose(),
      child: HomeWidget(),
    );
  }
}
