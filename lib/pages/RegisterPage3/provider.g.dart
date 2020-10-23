// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterPage3Mobx on RegisterPage3Base, Store {
  final _$sentenseAtom = Atom(name: 'RegisterPage3Base.sentense');

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

  final _$RegisterPage3BaseActionController =
      ActionController(name: 'RegisterPage3Base');

  @override
  dynamic getSentense() {
    final _$actionInfo = _$RegisterPage3BaseActionController.startAction(
        name: 'RegisterPage3Base.getSentense');
    try {
      return super.getSentense();
    } finally {
      _$RegisterPage3BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sentense: ${sentense}
    ''';
  }
}
