// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassCreatePage3Mobx on ClassCreatePage3Base, Store {
  final _$sentenseAtom = Atom(name: 'ClassListPageBase.sentense');

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

  final _$getSentenseAsyncAction = AsyncAction('ClassListPageBase.getSentense');

  @override
  Future<dynamic> getSentense() {
    return _$getSentenseAsyncAction.run(() => super.getSentense());
  }

  final _$ClassListPageBaseActionController =
      ActionController(name: 'ClassListPageBase');

  @override
  dynamic toClassCreatePage() {
    final _$actionInfo = _$ClassListPageBaseActionController.startAction(
        name: 'ClassListPageBase.toClassCreatePage');
    try {
      return super.toClassCreatePage();
    } finally {
      _$ClassListPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sentense: ${sentense}
    ''';
  }
}
