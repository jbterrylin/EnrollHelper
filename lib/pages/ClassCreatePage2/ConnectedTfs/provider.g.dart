// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectedTfsMobx on ConnectedTfsBase, Store {
  final _$dropdownItemsAtom = Atom(name: 'ConnectedTfsBase.dropdownItems');

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

  final _$ConnectedTfsBaseActionController =
      ActionController(name: 'ConnectedTfsBase');

  @override
  dynamic addPostFrameCallback() {
    final _$actionInfo = _$ConnectedTfsBaseActionController.startAction(
        name: 'ConnectedTfsBase.addPostFrameCallback');
    try {
      return super.addPostFrameCallback();
    } finally {
      _$ConnectedTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClass(String value, int dropdown) {
    final _$actionInfo = _$ConnectedTfsBaseActionController.startAction(
        name: 'ConnectedTfsBase.setClass');
    try {
      return super.setClass(value, dropdown);
    } finally {
      _$ConnectedTfsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dropdownItems: ${dropdownItems}
    ''';
  }
}
