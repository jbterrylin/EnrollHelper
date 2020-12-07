import 'package:flutter/material.dart';
import 'package:flutter_mobx_cb/api/model/Day.dart';
import 'package:flutter_mobx_cb/api/model/Subject.dart';
import 'package:flutter_mobx_cb/utils/EnrollCore/ClassEnroll.dart';
import 'package:flutter_mobx_cb/utils/PermutationAlgorithm.dart';
import 'package:flutter_mobx_cb/utils/Helper.dart';
import 'package:trotter/trotter.dart';

class EnrollProcessor {
  List<Subject> subjects;
  List<String> liketypes;
  List<String> mustsubjectstrings; // e.subjectcode + " - " + e.subjectname
  String nneededsubject;
  List<ClassEnroll> classenrolls;

  EnrollProcessor(this.subjects, this.liketypes, this.mustsubjectstrings,
      this.nneededsubject);

  main() {
    Map<String, List<List<String>>> subjectscombinations =
        Map<String, List<List<String>>>();
    subjects.forEach((subject) => subjectscombinations[subject.subjectcode] =
        (createSubjectCombinationWithTimeChecking(subject)));
  }

  // a(Map<String, List<List<String>>> subjectscombinations) {
  //   List<List<String>> combinations = List<List<String>>();
  //   subjectscombinations.forEach((name, type) {
  //     List<List<String>> tempcombination = Combinations(
  //             int.parse(type[1]),
  //             subject.classlist
  //                 .where((element) => element.type == type[0])
  //                 .map((e) => e.classcode)
  //                 .toList())()
  //         .toList();
  //     if (combinations.length == 0) {
  //       combinations = tempcombination;
  //     } else {
  //       combinations = PermutationAlgorithm([combinations, tempcombination])
  //           .permutations();
  //     }
  //   });
  //   return combinations;
  // }

  getPossibleCombination(Subject subject) {
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
        combinations = PermutationAlgorithm([combinations, tempcombination])
            .permutations();
      }
    });
    return combinations;
  }

  createSubjectCombinationWithTimeChecking(Subject subject) {
    List<List<String>> combinations = getPossibleCombination(subject);
    List<List<String>> combinationswanttodelete = List<List<String>>();
    combinations.forEach((combination) {
      debugPrint(combination.toString());
      Map<int, List<List<String>>> days = {
        1: [],
        2: [],
        3: [],
        4: [],
        5: [],
        6: [],
        7: []
      };
      combination.forEach((element) {
        subject.classlist
            .where((e) => e.classcode == element)
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
    combinations
        .removeWhere((element) => combinationswanttodelete.contains(element));
    return combinations;
  }
}
