// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleCreatePage2Mobx on ScheduleCreatePage2Base, Store {
  final _$selectedchipnameAtom =
      Atom(name: 'ScheduleCreatePage2Base.selectedchipname');

  @override
  ObservableList<String> get selectedchipname {
    _$selectedchipnameAtom.reportRead();
    return super.selectedchipname;
  }

  @override
  set selectedchipname(ObservableList<String> value) {
    _$selectedchipnameAtom.reportWrite(value, super.selectedchipname, () {
      super.selectedchipname = value;
    });
  }

  final _$mustsubjectsAtom = Atom(name: 'ScheduleCreatePage2Base.mustsubjects');

  @override
  ObservableList<Widget> get mustsubjects {
    _$mustsubjectsAtom.reportRead();
    return super.mustsubjects;
  }

  @override
  set mustsubjects(ObservableList<Widget> value) {
    _$mustsubjectsAtom.reportWrite(value, super.mustsubjects, () {
      super.mustsubjects = value;
    });
  }

  final _$notmustsubjectsAtom =
      Atom(name: 'ScheduleCreatePage2Base.notmustsubjects');

  @override
  ObservableList<Widget> get notmustsubjects {
    _$notmustsubjectsAtom.reportRead();
    return super.notmustsubjects;
  }

  @override
  set notmustsubjects(ObservableList<Widget> value) {
    _$notmustsubjectsAtom.reportWrite(value, super.notmustsubjects, () {
      super.notmustsubjects = value;
    });
  }

  final _$mustsubjectstringsAtom =
      Atom(name: 'ScheduleCreatePage2Base.mustsubjectstrings');

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

  final _$ScheduleCreatePage2BaseActionController =
      ActionController(name: 'ScheduleCreatePage2Base');

  @override
  dynamic setNNeededSubject() {
    final _$actionInfo = _$ScheduleCreatePage2BaseActionController.startAction(
        name: 'ScheduleCreatePage2Base.setNNeededSubject');
    try {
      return super.setNNeededSubject();
    } finally {
      _$ScheduleCreatePage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setsubjectchips() {
    final _$actionInfo = _$ScheduleCreatePage2BaseActionController.startAction(
        name: 'ScheduleCreatePage2Base.setsubjectchips');
    try {
      return super.setsubjectchips();
    } finally {
      _$ScheduleCreatePage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedchipname: ${selectedchipname},
mustsubjects: ${mustsubjects},
notmustsubjects: ${notmustsubjects},
mustsubjectstrings: ${mustsubjectstrings}
    ''';
  }
}
