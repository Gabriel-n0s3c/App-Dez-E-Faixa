// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_page_lista_jogadores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPageListaJogador on _ControllerPageListaJogadorBase, Store {
  final _$totalSelecionadoAtom =
      Atom(name: '_ControllerPageListaJogadorBase.totalSelecionado');

  @override
  int get totalSelecionado {
    _$totalSelecionadoAtom.reportRead();
    return super.totalSelecionado;
  }

  @override
  set totalSelecionado(int value) {
    _$totalSelecionadoAtom.reportWrite(value, super.totalSelecionado, () {
      super.totalSelecionado = value;
    });
  }

  final _$_ControllerPageListaJogadorBaseActionController =
      ActionController(name: '_ControllerPageListaJogadorBase');

  @override
  dynamic addJogador(Jogador j) {
    final _$actionInfo = _$_ControllerPageListaJogadorBaseActionController
        .startAction(name: '_ControllerPageListaJogadorBase.addJogador');
    try {
      return super.addJogador(j);
    } finally {
      _$_ControllerPageListaJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarJogador(Jogador j) {
    final _$actionInfo = _$_ControllerPageListaJogadorBaseActionController
        .startAction(name: '_ControllerPageListaJogadorBase.atualizarJogador');
    try {
      return super.atualizarJogador(j);
    } finally {
      _$_ControllerPageListaJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic excluirJogador(Jogador j) {
    final _$actionInfo = _$_ControllerPageListaJogadorBaseActionController
        .startAction(name: '_ControllerPageListaJogadorBase.excluirJogador');
    try {
      return super.excluirJogador(j);
    } finally {
      _$_ControllerPageListaJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalSelecionado: ${totalSelecionado}
    ''';
  }
}
