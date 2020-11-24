// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubjectCardMobx on SubjectCardBase, Store {
  final _$checkboxvalueAtom = Atom(name: 'SubjectCardBase.checkboxvalue');

  @override
  bool get checkboxvalue {
    _$checkboxvalueAtom.reportRead();
    return super.checkboxvalue;
  }

  @override
  set checkboxvalue(bool value) {
    _$checkboxvalueAtom.reportWrite(value, super.checkboxvalue, () {
      super.checkboxvalue = value;
    });
  }

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

  final _$SubjectCardBaseActionController =
      ActionController(name: 'SubjectCardBase');

  @override
  dynamic checkBoxOnChanged(bool value) {
    final _$actionInfo = _$SubjectCardBaseActionController.startAction(
        name: 'SubjectCardBase.checkBoxOnChanged');
    try {
      return super.checkBoxOnChanged(value);
    } finally {
      _$SubjectCardBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkboxvalue: ${checkboxvalue},
favoritelikecolor: ${favoritelikecolor}
    ''';
  }
}
