// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleCreatePage3Mobx on ScheduleCreatePage3Base, Store {
  final _$selectedchipnameAtom =
      Atom(name: 'ScheduleCreatePage3Base.selectedchipname');

  @override
  List<String> get selectedchipname {
    _$selectedchipnameAtom.reportRead();
    return super.selectedchipname;
  }

  @override
  set selectedchipname(List<String> value) {
    _$selectedchipnameAtom.reportWrite(value, super.selectedchipname, () {
      super.selectedchipname = value;
    });
  }

  final _$mustsubjectstringsAtom =
      Atom(name: 'ScheduleCreatePage3Base.mustsubjectstrings');

  @override
  ObservableList<String> get mustsubjectstrings {
    _$mustsubjectstringsAtom.reportRead();
    return super.mustsubjectstrings;
  }

  @override
  set mustsubjectstrings(ObservableList<String> value) {
    _$mustsubjectstringsAtom.reportWrite(value, super.mustsubjectstrings, () {
      super.mustsubjectstrings = value;
    });
  }

  final _$nneededsubjectAtom =
      Atom(name: 'ScheduleCreatePage3Base.nneededsubject');

  @override
  String get nneededsubject {
    _$nneededsubjectAtom.reportRead();
    return super.nneededsubject;
  }

  @override
  set nneededsubject(String value) {
    _$nneededsubjectAtom.reportWrite(value, super.nneededsubject, () {
      super.nneededsubject = value;
    });
  }

  @override
  String toString() {
    return '''
selectedchipname: ${selectedchipname},
mustsubjectstrings: ${mustsubjectstrings},
nneededsubject: ${nneededsubject}
    ''';
  }
}
