import 'package:flutter/material.dart';

class GlobalStyle {
  GlobalStyle();

  getTitleStyle() {
    return new TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  }

  getTfStyle() {
    return new TextStyle(fontSize: 24.0);
  }

  getTfDeco(String labelText, String hintText) {
    return new InputDecoration(
        labelStyle: new TextStyle(fontSize: 24, height: 0.7),
        labelText: labelText,
        border: OutlineInputBorder(),
        hintText: hintText);
  }

  void dispose() {}
}
