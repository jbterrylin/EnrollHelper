import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/Helper.dart';

class Schedule {
  List<Subject> subject = List<Subject>();

  Map<String, List<List<String>>> basicschedule =
      Map<String, List<List<String>>>();

  // Map<int, List<List<String>>> schedule = {
  //   1: [],
  //   2: [],
  //   3: [],
  //   4: [],
  //   5: [],
  //   6: [],
  //   7: []
  // };

  Schedule();
}
