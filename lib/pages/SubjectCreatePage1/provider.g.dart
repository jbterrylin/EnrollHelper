// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectCreatePage1Mobx on SubjectCreatePage1Base, Store {
  final _$classlistAtom = Atom(name: 'SubjectCreatePage1Base.classlist');

  @override
  ObservableList<Class> get classlist {
    _$classlistAtom.reportRead();
    return super.classlist;
  }

  @override
  set classlist(ObservableList<Class> value) {
    _$classlistAtom.reportWrite(value, super.classlist, () {
      super.classlist = value;
    });
  }

  final _$classtfAtom = Atom(name: 'SubjectCreatePage1Base.classtf');

  @override
  ObservableList<Widget> get classtf {
    _$classtfAtom.reportRead();
    return super.classtf;
  }

  @override
  set classtf(ObservableList<Widget> value) {
    _$classtfAtom.reportWrite(value, super.classtf, () {
      super.classtf = value;
    });
  }

  final _$SubjectCreatePage1BaseActionController =
      ActionController(name: 'SubjectCreatePage1Base');

  @override
  dynamic addClassTf(int index) {
    final _$actionInfo = _$SubjectCreatePage1BaseActionController.startAction(
        name: 'SubjectCreatePage1Base.addClassTf');
    try {
      return super.addClassTf(index);
    } finally {
      _$SubjectCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubjectCode() {
    final _$actionInfo = _$SubjectCreatePage1BaseActionController.startAction(
        name: 'SubjectCreatePage1Base.setSubjectCode');
    try {
      return super.setSubjectCode();
    } finally {
      _$SubjectCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubjectName() {
    final _$actionInfo = _$SubjectCreatePage1BaseActionController.startAction(
        name: 'SubjectCreatePage1Base.setSubjectName');
    try {
      return super.setSubjectName();
    } finally {
      _$SubjectCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classlist: ${classlist},
classtf: ${classtf}
    ''';
  }
}
