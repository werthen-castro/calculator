// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$resultAtom = Atom(name: 'ControllerBase.result');

  @override
  double get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(double value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$expressionAtom = Atom(name: 'ControllerBase.expression');

  @override
  String get expressionTotal {
    _$expressionAtom.reportRead();
    return super.expressionTotal;
  }

  @override
  set expressionTotal(String value) {
    _$expressionAtom.reportWrite(value, super.expressionTotal, () {
      super.expressionTotal = value;
    });
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic teclar(String op) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.incrementar');
    try {
      return super.teclar(op);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
expression: ${expressionTotal}
    ''';
  }
}
