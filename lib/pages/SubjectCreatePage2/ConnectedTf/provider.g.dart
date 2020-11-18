// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectedTfMobx on ConnectedTfBase, Store {
  final _$dropdownItemsAtom = Atom(name: 'ConnectedTfBase.dropdownItems');

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

  final _$ConnectedTfBaseActionController =
      ActionController(name: 'ConnectedTfBase');

  @override
  dynamic addPostFrameCallback() {
    final _$actionInfo = _$ConnectedTfBaseActionController.startAction(
        name: 'ConnectedTfBase.addPostFrameCallback');
    try {
      return super.addPostFrameCallback();
    } finally {
      _$ConnectedTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClass(String value, int dropdown) {
    final _$actionInfo = _$ConnectedTfBaseActionController.startAction(
        name: 'ConnectedTfBase.setClass');
    try {
      return super.setClass(value, dropdown);
    } finally {
      _$ConnectedTfBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dropdownItems: ${dropdownItems}
    ''';
  }
}
