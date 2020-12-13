import 'package:flutter/material.dart';

TimeOfDay stringToTimeOfDay(String time) {
  int hour = 0;
  if (time.contains("AM") && time.split(":")[0] == "12") {
    // for 12:00 AM
    hour = 0;
  } else if (time.contains("PM") && time.split(":")[0] != "12") {
    // for pm
    hour = 12 + int.parse(time.split(":")[0]);
  } else {
    // for am
    hour = int.parse(time.split(":")[0]);
  }
  return TimeOfDay(
      hour: hour, minute: int.parse(time.split(":")[1].split(" ")[0]));
}

double timeOfDayToDouble(TimeOfDay myTime) {
  return myTime.hour + myTime.minute / 60.0;
}

double timeStringToDouble(String time) {
  var temp = stringToTimeOfDay(time);
  return timeOfDayToDouble(temp);
}

bool betweenTime(List<String> a, String b) {
  if (timeStringToDouble(a[0]) < timeStringToDouble(b) &&
      timeStringToDouble(a[1]) > timeStringToDouble(b)) {
    return true;
  }
  return false;
}
