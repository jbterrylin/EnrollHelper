// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectCreatePage2Mobx on SubjectCreatePage2Base, Store {
  final _$connectedtfsAtom = Atom(name: 'SubjectCreatePage2Base.connectedtfs');

  @override
  ObservableList<Widget> get connectedtfs {
    _$connectedtfsAtom.reportRead();
    return super.connectedtfs;
  }

  @override
  set connectedtfs(ObservableList<Widget> value) {
    _$connectedtfsAtom.reportWrite(value, super.connectedtfs, () {
      super.connectedtfs = value;
    });
  }

  final _$sentenseAtom = Atom(name: 'SubjectCreatePage2Base.sentense');

  @override
  String get sentense {
    _$sentenseAtom.reportRead();
    return super.sentense;
  }

  @override
  set sentense(String value) {
    _$sentenseAtom.reportWrite(value, super.sentense, () {
      super.sentense = value;
    });
  }

  final _$SubjectCreatePage2BaseActionController =
      ActionController(name: 'SubjectCreatePage2Base');

  @override
  dynamic addConnectedTfs() {
    final _$actionInfo = _$SubjectCreatePage2BaseActionController.startAction(
        name: 'SubjectCreatePage2Base.addConnectedTfs');
    try {
      return super.addConnectedTfs();
    } finally {
      _$SubjectCreatePage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteConnectedTfs() {
    final _$actionInfo = _$SubjectCreatePage2BaseActionController.startAction(
        name: 'SubjectCreatePage2Base.deleteConnectedTfs');
    try {
      return super.deleteConnectedTfs();
    } finally {
      _$SubjectCreatePage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getSentense() {
    final _$actionInfo = _$SubjectCreatePage2BaseActionController.startAction(
        name: 'SubjectCreatePage2Base.getSentense');
    try {
      return super.getSentense();
    } finally {
      _$SubjectCreatePage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectedtfs: ${connectedtfs},
sentense: ${sentense}
    ''';
  }
}
