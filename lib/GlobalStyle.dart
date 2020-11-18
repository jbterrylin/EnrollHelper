import 'package:flutter/material.dart';

class GlobalStyle {
  GlobalStyle();

  getSideMargin(context, widget) {
    return Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
        width: MediaQuery.of(context).size.width,
        child: widget);
  }

  getTitleStyle() {
    return TextStyle();
  }

  getSmallTileStyle() {
    return TextStyle();
  }

  getsExtraSmallTileStyle() {
    return TextStyle();
  }

  getTfStyle() {
    return TextStyle();
  }

  getTfDeco(String labeltext, String hinttext, String errortext) {
    return new InputDecoration(
      labelText: labeltext,
      hintText: hinttext,
      errorText: errortext,
    );
  }

  getDropdownButtonFormFieldDeco() {
    return InputDecoration();
  }

  void dispose() {}
}
