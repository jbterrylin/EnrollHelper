// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectedDdMobx on ConnectedDdBase, Store {
  final _$dropdownItemsAtom = Atom(name: 'ConnectedDdBase.dropdownItems');

  @override
  ObservableList<DropdownMenuItem<dynamic>> get dropdownItems {
    _$dropdownItemsAtom.reportRead();
    return super.dropdownItems;
  }

  @override
  set dropdownItems(ObservableList<DropdownMenuItem<dynamic>> value) {
    _$dropdownItemsAtom.reportWrite(value, super.dropdownItems, () {
      super.dropdownItems = value;
    });
  }

  final _$ConnectedDdBaseActionController =
      ActionController(name: 'ConnectedDdBase');

  @override
  dynamic setClass(String value) {
    final _$actionInfo = _$ConnectedDdBaseActionController.startAction(
        name: 'ConnectedDdBase.setClass');
    try {
      return super.setClass(value);
    } finally {
      _$ConnectedDdBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dropdownItems: ${dropdownItems}
    ''';
  }
}
