// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassCreatePage1Mobx on ClassCreatePage1Base, Store {
  final _$classlistAtom = Atom(name: 'ClassCreatePage1Base.classlist');

  @override
  ObservableList<Class> get classlist {
    _$classlistAtom.reportRead();
    return super.classlist;
  }

  @override
  set classlist(ObservableList<Class> value) {
    _$classlistAtom.reportWrite(value, super.classlist, () {
      super.classlist = value;
    });
  }

  final _$classtfAtom = Atom(name: 'ClassCreatePage1Base.classtf');

  @override
  ObservableList<Widget> get classtf {
    _$classtfAtom.reportRead();
    return super.classtf;
  }

  @override
  set classtf(ObservableList<Widget> value) {
    _$classtfAtom.reportWrite(value, super.classtf, () {
      super.classtf = value;
    });
  }

  final _$ClassCreatePage1BaseActionController =
      ActionController(name: 'ClassCreatePage1Base');

  @override
  dynamic addClassTf(int index) {
    final _$actionInfo = _$ClassCreatePage1BaseActionController.startAction(
        name: 'ClassCreatePage1Base.addClassTf');
    try {
      return super.addClassTf(index);
    } finally {
      _$ClassCreatePage1BaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
classlist: ${classlist},
classtf: ${classtf}
    ''';
  }
}
