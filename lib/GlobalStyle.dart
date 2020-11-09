import 'package:flutter/material.dart';

class GlobalStyle {
  GlobalStyle();

  getTitleStyle() {
    return TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  }

  getSmallTileStyle() {
    return TextStyle(fontSize: 24.0);
  }

  getsExtraSmallTileStyle() {
    return TextStyle(fontSize: 16.0);
  }

  getTfStyle() {
    return TextStyle(fontSize: 24.0);
  }

  getTfDeco(String labeltext, String hinttext, String errortext) {
    return new InputDecoration(
      labelStyle: new TextStyle(fontSize: 24, height: 0.7),
      labelText: labeltext,
      hintText: hinttext,
      errorText: errortext,
      border: OutlineInputBorder(),
    );
  }

  getDropdownButtonFormFieldDeco() {
    return InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 22.5, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)));
  }

  void dispose() {}
}
