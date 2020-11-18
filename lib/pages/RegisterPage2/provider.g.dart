// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterPage2Mobx on RegisterPage2Base, Store {
  final _$sentenseAtom = Atom(name: 'RegisterPage2Base.sentense');

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

  final _$RegisterPage2BaseActionController =
      ActionController(name: 'RegisterPage2Base');

  @override
  dynamic nextPage() {
    final _$actionInfo = _$RegisterPage2BaseActionController.startAction(
        name: 'RegisterPage2Base.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$RegisterPage2BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sentense: ${sentense}
    ''';
  }
}
