// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassCardMobx on ClassCardBase, Store {
  final _$connectedStringAtom = Atom(name: 'ClassCardBase.connectedString');

  @override
  String get connectedString {
    _$connectedStringAtom.reportRead();
    return super.connectedString;
  }

  @override
  set connectedString(String value) {
    _$connectedStringAtom.reportWrite(value, super.connectedString, () {
      super.connectedString = value;
    });
  }

  @override
  String toString() {
    return '''
connectedString: ${connectedString}
    ''';
  }
}
