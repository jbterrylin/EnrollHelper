// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassTfsMobx on ClassTfsBase, Store {
  final _$classtfAtom = Atom(name: 'ClassTfsBase.classtf');

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

  final _$daytimetfAtom = Atom(name: 'ClassTfsBase.daytimetf');

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

  final _$ClassTfsBaseActionController = ActionController(name: 'ClassTfsBase');

  @override
  dynamic addPostFrameCallback() {
    final _$actionInfo = _$ClassTfsBaseActionController.startAction(
        name: 'ClassTfsBase.addPostFrameCallback');
    try {
      return super.addPostFrameCallback();
    } finally {
      _$ClassTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPriority(String value) {
    final _$actionInfo = _$ClassTfsBaseActionController.startAction(
        name: 'ClassTfsBase.setPriority');
    try {
      return super.setPriority(value);
    } finally {
      _$ClassTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClasscode(String value) {
    final _$actionInfo = _$ClassTfsBaseActionController.startAction(
        name: 'ClassTfsBase.setClasscode');
    try {
      return super.setClasscode(value);
    } finally {
      _$ClassTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addDayTime() {
    final _$actionInfo = _$ClassTfsBaseActionController.startAction(
        name: 'ClassTfsBase.addDayTime');
    try {
      return super.addDayTime();
    } finally {
      _$ClassTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classtf: ${classtf},
daytimetf: ${daytimetf}
    ''';
  }
}
