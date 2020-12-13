import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Schedule.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/EnrollCore/ClassEnroll.dart';
import 'package:flutter_mobx_cb/utils/PermutationAlgorithm.dart';
import 'package:flutter_mobx_cb/utils/Helper.dart';
import 'package:trotter/trotter.dart';

class EnrollProcessor {
  List<Subject> subjects;
  List<String> liketypes;
  List<String> mustsubjectstrings; // e.subjectcode
  String nneededsubject;
  List<ClassEnroll> classenrolls;

  EnrollProcessor(this.subjects, this.liketypes, this.mustsubjectstrings,
      this.nneededsubject);

  main() {
    // mustsubjectstrings.sort();

    // filter subject class with
    Map<String, List<List<String>>> subjectscombinations =
        Map<String, List<List<String>>>();
    subjects.forEach((subject) {
      subjectscombinations[subject.subjectcode] =
          createSubjectCombinationWithTimeChecking({
        subject.subjectcode: getSubjectPossibleCombination(subject)
      })[subject.subjectcode];
    });
    debugPrint(subjectscombinations.toString());

    // create possible schedule combination
    debugPrint("create possible schedule combination");
    List<List<String>> combinations = List<List<String>>();
    for (var subjectstring in mustsubjectstrings) {
      if (subjectstring == mustsubjectstrings[0]) {
        combinations = subjectscombinations[subjectstring];
      } else {
        combinations = PermutationAlgorithm(
                [combinations, subjectscombinations[subjectstring]],
                subjectstring)
            .permutations();
      }
    }

    debugPrint("filter schedule");
    List<Schedule> schedules = List<Schedule>();
    combinations.forEach((combination) {
      schedules.add(Schedule());
      var a = scheduleListToMap([...mustsubjectstrings], combination);
      if (a == createSubjectCombinationWithTimeChecking(a)) {
        schedules.add(Schedule());
        schedules.last.basicschedule = a;
      }
    });
  }

  List<List<String>> getSubjectPossibleCombination(Subject subject) {
    List<List<String>> combinations = List<List<String>>();
    subject.typelist.forEach((type) {
      List<List<String>> tempcombination = Combinations(
              int.parse(type[1]),
              subject.classlist
                  .where((element) => element.type == type[0])
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

  Map<String, List<List<String>>> createSubjectCombinationWithTimeChecking(
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
              .where((element) => element.subjectcode == key)
              .toList()[0]
              .classlist
              .where((e) => e.classcode == combinationclasscode)
              .toList()[0]
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

  Map<String, List<List<String>>> scheduleListToMap(
      List<String> subjectstrings, List<String> combination) {
    int startindex = -1;
    Map<String, List<List<String>>> result = Map<String, List<List<String>>>();
    while (true) {
      if (combination.indexOf(null, startindex + 1) == -1) {
        result[subjectstrings.removeAt(0)] = [
          combination.sublist(startindex + 1, combination.length)
        ];
        break;
      }
      result[subjectstrings.removeAt(0)] = [
        combination.sublist(
            startindex + 1, combination.indexOf(null, startindex + 1))
      ];

      startindex = combination.indexOf(null, startindex + 1);
    }
    return result;
  }
}
