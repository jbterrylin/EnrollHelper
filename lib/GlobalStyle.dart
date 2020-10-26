import 'package:flutter/material.dart';

class GlobalStyle {
  GlobalStyle();

  getTitleStyle() {
    return TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  }

  getTfStyle() {
    return TextStyle(fontSize: 24.0);
  }

  getTfDeco(String labelText, String hintText) {
    return new InputDecoration(
        labelStyle: new TextStyle(fontSize: 24, height: 0.7),
        labelText: labelText,
        border: OutlineInputBorder(),
        hintText: hintText);
  }

  getDropdownButtonFormFieldDeco() {
    return InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 22.5, horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)));
  }

  void dispose() {}
}
