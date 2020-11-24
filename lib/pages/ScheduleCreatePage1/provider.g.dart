// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleCreatePage1Mobx on ScheduleCreatePage1Base, Store {
  final _$subjectsAtom = Atom(name: 'ScheduleCreatePage1Base.subjects');

  @override
  List<Subject> get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(List<Subject> value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$listtiletfsAtom = Atom(name: 'ScheduleCreatePage1Base.listtiletfs');

  @override
  ObservableList<Widget> get listtiletfs {
    _$listtiletfsAtom.reportRead();
    return super.listtiletfs;
  }

  @override
  set listtiletfs(ObservableList<Widget> value) {
    _$listtiletfsAtom.reportWrite(value, super.listtiletfs, () {
      super.listtiletfs = value;
    });
  }

  final _$chipsAtom = Atom(name: 'ScheduleCreatePage1Base.chips');

  @override
  ObservableList<Widget> get chips {
    _$chipsAtom.reportRead();
    return super.chips;
  }

  @override
  set chips(ObservableList<Widget> value) {
    _$chipsAtom.reportWrite(value, super.chips, () {
      super.chips = value;
    });
  }

  final _$selectedchipnameAtom =
      Atom(name: 'ScheduleCreatePage1Base.selectedchipname');

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

  final _$ScheduleCreatePage1BaseActionController =
      ActionController(name: 'ScheduleCreatePage1Base');

  @override
  dynamic setChips() {
    final _$actionInfo = _$ScheduleCreatePage1BaseActionController.startAction(
        name: 'ScheduleCreatePage1Base.setChips');
    try {
      return super.setChips();
    } finally {
      _$ScheduleCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListtileTfs() {
    final _$actionInfo = _$ScheduleCreatePage1BaseActionController.startAction(
        name: 'ScheduleCreatePage1Base.setListtileTfs');
    try {
      return super.setListtileTfs();
    } finally {
      _$ScheduleCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subjects: ${subjects},
listtiletfs: ${listtiletfs},
chips: ${chips},
selectedchipname: ${selectedchipname}
    ''';
  }
}
