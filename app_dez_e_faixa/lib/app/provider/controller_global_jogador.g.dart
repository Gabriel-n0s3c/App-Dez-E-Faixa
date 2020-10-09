// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_global_jogador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerGlobalJogador on _ControllerGlobalJogadorBase, Store {
  final _$listaJogadoresAtom =
      Atom(name: '_ControllerGlobalJogadorBase.listaJogadores');

  @override
  ObservableList<Jogador> get listaJogadores {
    _$listaJogadoresAtom.reportRead();
    return super.listaJogadores;
  }

  @override
  set listaJogadores(ObservableList<Jogador> value) {
    _$listaJogadoresAtom.reportWrite(value, super.listaJogadores, () {
      super.listaJogadores = value;
    });
  }

  final _$_ControllerGlobalJogadorBaseActionController =
      ActionController(name: '_ControllerGlobalJogadorBase');

  @override
  dynamic _carregarLista() {
    final _$actionInfo = _$_ControllerGlobalJogadorBaseActionController
        .startAction(name: '_ControllerGlobalJogadorBase._carregarLista');
    try {
      return super._carregarLista();
    } finally {
      _$_ControllerGlobalJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addJogador(Jogador j) {
    final _$actionInfo = _$_ControllerGlobalJogadorBaseActionController
        .startAction(name: '_ControllerGlobalJogadorBase.addJogador');
    try {
      return super.addJogador(j);
    } finally {
      _$_ControllerGlobalJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarJogador(Jogador j) {
    final _$actionInfo = _$_ControllerGlobalJogadorBaseActionController
        .startAction(name: '_ControllerGlobalJogadorBase.atualizarJogador');
    try {
      return super.atualizarJogador(j);
    } finally {
      _$_ControllerGlobalJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic excluirJogador(Jogador j) {
    final _$actionInfo = _$_ControllerGlobalJogadorBaseActionController
        .startAction(name: '_ControllerGlobalJogadorBase.excluirJogador');
    try {
      return super.excluirJogador(j);
    } finally {
      _$_ControllerGlobalJogadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaJogadores: ${listaJogadores}
    ''';
  }
}
