// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectListPageMobx on SubjectListPageBase, Store {
  final _$sentenseAtom = Atom(name: 'SubjectListPageBase.sentense');

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

  final _$listtiletfsAtom = Atom(name: 'SubjectListPageBase.listtiletfs');

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

  final _$getSentenseAsyncAction =
      AsyncAction('SubjectListPageBase.getSentense');

  @override
  Future<dynamic> getSentense() {
    return _$getSentenseAsyncAction.run(() => super.getSentense());
  }

  final _$SubjectListPageBaseActionController =
      ActionController(name: 'SubjectListPageBase');

  @override
  dynamic addPostFrameCallback() {
    final _$actionInfo = _$SubjectListPageBaseActionController.startAction(
        name: 'SubjectListPageBase.addPostFrameCallback');
    try {
      return super.addPostFrameCallback();
    } finally {
      _$SubjectListPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toSubjectCreatePage() {
    final _$actionInfo = _$SubjectListPageBaseActionController.startAction(
        name: 'SubjectListPageBase.toSubjectCreatePage');
    try {
      return super.toSubjectCreatePage();
    } finally {
      _$SubjectListPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sentense: ${sentense},
listtiletfs: ${listtiletfs}
    ''';
  }
}
