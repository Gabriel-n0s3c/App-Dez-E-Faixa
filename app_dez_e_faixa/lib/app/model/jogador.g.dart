// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jogador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Jogador on _JogadorBase, Store {
  final _$nomeAtom = Atom(name: '_JogadorBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$isSelectedAtom = Atom(name: '_JogadorBase.isSelected');

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  final _$_JogadorBaseActionController = ActionController(name: '_JogadorBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_JogadorBaseActionController.startAction(
        name: '_JogadorBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_JogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo = _$_JogadorBaseActionController.startAction(
        name: '_JogadorBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_JogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
isSelected: ${isSelected}
    ''';
  }
}
