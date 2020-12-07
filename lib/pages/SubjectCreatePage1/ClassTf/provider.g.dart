// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassTfMobx on ClassTfBase, Store {
  final _$indexAtom = Atom(name: 'ClassTfBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$classcodeerrortextAtom = Atom(name: 'ClassTfBase.classcodeerrortext');

  @override
  String get classcodeerrortext {
    _$classcodeerrortextAtom.reportRead();
    return super.classcodeerrortext;
  }

  @override
  set classcodeerrortext(String value) {
    _$classcodeerrortextAtom.reportWrite(value, super.classcodeerrortext, () {
      super.classcodeerrortext = value;
    });
  }

  final _$classtfAtom = Atom(name: 'ClassTfBase.classtf');

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

  final _$daytimetfAtom = Atom(name: 'ClassTfBase.daytimetf');

  @override
  ObservableList<Widget> get daytimetf {
    _$daytimetfAtom.reportRead();
    return super.daytimetf;
  }

  @override
  set daytimetf(ObservableList<Widget> value) {
    _$daytimetfAtom.reportWrite(value, super.daytimetf, () {
      super.daytimetf = value;
    });
  }

  final _$ClassTfBaseActionController = ActionController(name: 'ClassTfBase');

  @override
  dynamic addPostFrameCallback() {
    final _$actionInfo = _$ClassTfBaseActionController.startAction(
        name: 'ClassTfBase.addPostFrameCallback');
    try {
      return super.addPostFrameCallback();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType() {
    final _$actionInfo =
        _$ClassTfBaseActionController.startAction(name: 'ClassTfBase.setType');
    try {
      return super.setType();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPriority() {
    final _$actionInfo = _$ClassTfBaseActionController.startAction(
        name: 'ClassTfBase.setPriority');
    try {
      return super.setPriority();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClasscode() {
    final _$actionInfo = _$ClassTfBaseActionController.startAction(
        name: 'ClassTfBase.setClasscode');
    try {
      return super.setClasscode();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addDayTime() {
    final _$actionInfo = _$ClassTfBaseActionController.startAction(
        name: 'ClassTfBase.addDayTime');
    try {
      return super.addDayTime();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteDayTime() {
    final _$actionInfo = _$ClassTfBaseActionController.startAction(
        name: 'ClassTfBase.deleteDayTime');
    try {
      return super.deleteDayTime();
    } finally {
      _$ClassTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
classcodeerrortext: ${classcodeerrortext},
classtf: ${classtf},
daytimetf: ${daytimetf}
    ''';
  }
}
