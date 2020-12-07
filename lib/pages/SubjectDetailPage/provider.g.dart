// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectDetailPageMobx on SubjectDetailPageBase, Store {
  final _$typeAtom = Atom(name: 'SubjectDetailPageBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$sentenseAtom = Atom(name: 'SubjectDetailPageBase.sentense');

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

  final _$nextPageAsyncAction = AsyncAction('SubjectDetailPageBase.nextPage');

  @override
  Future nextPage() {
    return _$nextPageAsyncAction.run(() => super.nextPage());
  }

  final _$SubjectDetailPageBaseActionController =
      ActionController(name: 'SubjectDetailPageBase');

  @override
  dynamic getSentense() {
    final _$actionInfo = _$SubjectDetailPageBaseActionController.startAction(
        name: 'SubjectDetailPageBase.getSentense');
    try {
      return super.getSentense();
    } finally {
      _$SubjectDetailPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
sentense: ${sentense}
    ''';
  }
}
