// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectCardMobx on SubjectCardBase, Store {
  final _$favoritelikecolorAtom =
      Atom(name: 'SubjectCardBase.favoritelikecolor');

  @override
  Color get favoritelikecolor {
    _$favoritelikecolorAtom.reportRead();
    return super.favoritelikecolor;
  }

  @override
  set favoritelikecolor(Color value) {
    _$favoritelikecolorAtom.reportWrite(value, super.favoritelikecolor, () {
      super.favoritelikecolor = value;
    });
  }

  @override
  String toString() {
    return '''
favoritelikecolor: ${favoritelikecolor}
    ''';
  }
}
