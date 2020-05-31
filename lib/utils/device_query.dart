import 'package:flutter/material.dart';

extension DeviceQuery on BuildContext {
  double getXdp(int percentage) {
    return MediaQuery.of(this).size.width * (percentage / 100);
  }

  double getYdp(int percentage) {
    return MediaQuery.of(this).size.height * (percentage / 100);
  }

  double statusBarHeight() {
    return MediaQuery.of(this).padding.top;
  }
}
