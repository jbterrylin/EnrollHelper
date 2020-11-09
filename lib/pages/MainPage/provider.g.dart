// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainPageMobx on MainPageBase, Store {
  final _$currentIndexAtom = Atom(name: 'MainPageBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$sentenseAtom = Atom(name: 'MainPageBase.sentense');

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

  final _$appbartitleAtom = Atom(name: 'MainPageBase.appbartitle');

  @override
  String get appbartitle {
    _$appbartitleAtom.reportRead();
    return super.appbartitle;
  }

  @override
  set appbartitle(String value) {
    _$appbartitleAtom.reportWrite(value, super.appbartitle, () {
      super.appbartitle = value;
    });
  }

  final _$childrenAtom = Atom(name: 'MainPageBase.children');

  @override
  ObservableMap<String, Widget> get children {
    _$childrenAtom.reportRead();
    return super.children;
  }

  @override
  set children(ObservableMap<String, Widget> value) {
    _$childrenAtom.reportWrite(value, super.children, () {
      super.children = value;
    });
  }

  final _$MainPageBaseActionController = ActionController(name: 'MainPageBase');

  @override
  dynamic changePage(String index, dynamic shit) {
    final _$actionInfo = _$MainPageBaseActionController.startAction(
        name: 'MainPageBase.changePage');
    try {
      return super.changePage(index, shit);
    } finally {
      _$MainPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTabTapped(int index) {
    final _$actionInfo = _$MainPageBaseActionController.startAction(
        name: 'MainPageBase.onTabTapped');
    try {
      return super.onTabTapped(index);
    } finally {
      _$MainPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
sentense: ${sentense},
appbartitle: ${appbartitle},
children: ${children}
    ''';
  }
}
