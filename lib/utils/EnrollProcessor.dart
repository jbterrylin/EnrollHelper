import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Schedule.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/PermutationAlgorithm.dart';
import 'package:flutter_mobx_cb/utils/Helper.dart';
import 'package:trotter/trotter.dart';

class EnrollProcessor {
  List<Subject> subjects;
  List<String> liketypes;
  List<String> mustsubjectstrings; // e.subjectcode
  List<String> notmustsubjectstrings;
  String nneededsubject;
  List<Schedule> schedules = List<Schedule>();

  EnrollProcessor(this.subjects, this.liketypes, this.mustsubjectstrings,
      this.nneededsubject) {
    notmustsubjectstrings = subjects
        .where((element) => !mustsubjectstrings.contains(element.subjectcode))
        .map((e) => e.subjectcode)
        .toList();
  }

  main() {
    debugPrint("create class combination in each class and time checking");
    Map<String, List<List<String>>> subjectscombinations =
        Map<String, List<List<String>>>();
    subjects.forEach((subject) {
      subjectscombinations[subject.subjectcode] = combinationWithTimeChecking({
        subject.subjectcode: getSubjectPossibleCombination(subject)
      })[subject.subjectcode];
    });
    debugPrint("subjectscombinations: " + subjectscombinations.toString());
    debugPrint(
        "------------------------------------------------------------------");

    debugPrint("create possible schedule combination for must subject");
    List<List<String>> mustsubjectcombinationstrings = List<List<String>>();
    for (var subjectstring in mustsubjectstrings) {
      if (mustsubjectcombinationstrings.isEmpty) {
        mustsubjectcombinationstrings = subjectscombinations[subjectstring];
      } else {
        mustsubjectcombinationstrings = PermutationAlgorithm([
          mustsubjectcombinationstrings,
          subjectscombinations[subjectstring]
        ], subjectstring)
            .permutations();
      }
    }
    debugPrint("mustsubjectcombinationstrings: " +
        mustsubjectcombinationstrings.toString());
    debugPrint(
        "------------------------------------------------------------------");

    debugPrint("filter mustsubject schedule by time checking");
    mustsubjectcombinationstrings.forEach((combination) {
      // schedules.add(Schedule());
      var schedule = scheduleListToMap(mustsubjectstrings, combination, null);
      if (schedule == combinationWithTimeChecking(schedule)) {
        debugPrint("success");
      } else {
        debugPrint("fail");
      }
    });
    debugPrint(
        "------------------------------------------------------------------");

    debugPrint("create not must subject combination strings");
    List<List<String>> nmustsubjectcombinationstrings = Combinations(
            int.parse(nneededsubject) - mustsubjectstrings.length,
            notmustsubjectstrings)()
        .toList();
    debugPrint("notmustsubjectcombinationstrings" +
        nmustsubjectcombinationstrings.toString());
    debugPrint(
        "------------------------------------------------------------------");

    debugPrint("create combination of must subject and not must subject");
    nmustsubjectcombinationstrings.forEach((notmustsubjectstrings) {
      List<List<String>> temp = mustsubjectcombinationstrings;
      notmustsubjectstrings.forEach((notmustsubjectstring) {
        //   debugPrint("notmustsubjectstring" + notmustsubjectstring.toString());
        temp = PermutationAlgorithm(
                [temp, subjectscombinations[notmustsubjectstring]],
                notmustsubjectstring)
            .permutations();
      });
      if (temp.isNotEmpty) {
        for (var element in temp) {
          var aaa = new Schedule();
          aaa.basicschedule = scheduleListToMap(
              [...mustsubjectstrings, ...notmustsubjectstrings], element, null);
          schedules.add(aaa);
          aaa.subject = subjects;
        }
      }
    });
    debugPrint(
        "------------------------------------------------------------------");
    debugPrint("end");
  }

  // List<List<String>> heiheihei() {

  // }

  List<List<String>> getSubjectPossibleCombination(Subject subject) {
    List<List<String>> combinations = List<List<String>>();
    subject.typelist.forEach((type) {
      List<List<String>> tempcombination = Combinations(
              int.parse(type[1]),
              subject.classlist
                  .where((element) => element.type == type.first)
                  .map((e) => e.classcode)
                  .toList())()
          .toList();
      if (combinations.length == 0) {
        combinations = tempcombination;
      } else {
        combinations =
            PermutationAlgorithm([combinations, tempcombination], null)
                .permutations();
      }
    });
    return combinations;
  }

  Map<String, List<List<String>>> combinationWithTimeChecking(
      Map<String, List<List<String>>> temp) {
    List<List<String>> combinationswanttodelete = List<List<String>>();
    Map<int, List<List<String>>> days = {
      1: [],
      2: [],
      3: [],
      4: [],
      5: [],
      6: [],
      7: []
    };
    temp.forEach((key, combinations) {
      combinations.forEach((combination) {
        combination.forEach((combinationclasscode) {
          subjects
              .firstWhere((element) => element.subjectcode == key)
              .classlist
              .firstWhere((e) => e.classcode == combinationclasscode)
              .days
              .forEach((value) {
            var temp = true;
            if (days[value.day].length == 0) {
              days[value.day].add(value.time);
            } else {
              for (var element in days[value.day]) {
                if (betweenTime(element, value.time[0]) ||
                    betweenTime(element, value.time[1])) {
                  combinationswanttodelete.add(combination);
                  temp = false;
                  break;
                }
              }
              if (temp) {
                days[value.day].add(value.time);
              }
            }
          });
        });
      });
      temp[key]
          .removeWhere((element) => combinationswanttodelete.contains(element));
    });
    return temp;
  }

  Map<String, List<List<String>>> scheduleListToMap(List<String> subjectstrings,
      List<String> combination, Map<String, List<List<String>>> result) {
    int startindex = -1;
    var subjectstringlist = [...subjectstrings];
    if (result == null) {
      result = Map<String, List<List<String>>>();
    }
    while (true) {
      if (combination.indexOf(null, startindex + 1) == -1) {
        result[subjectstringlist.removeAt(0)] = [
          combination.sublist(startindex + 1, combination.length)
        ];
        break;
      }
      result[subjectstringlist.removeAt(0)] = [
        combination.sublist(
            startindex + 1, combination.indexOf(null, startindex + 1))
      ];

      startindex = combination.indexOf(null, startindex + 1);
    }
    return result;
  }
}
