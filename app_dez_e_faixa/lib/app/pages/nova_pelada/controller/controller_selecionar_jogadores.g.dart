// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_selecionar_jogadores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerSelecionarJogador on _ControllerSelecionarJogadorBase, Store {
  Computed<int> _$totalSelecionadoComputed;

  @override
  int get totalSelecionado => (_$totalSelecionadoComputed ??= Computed<int>(
          () => super.totalSelecionado,
          name: '_ControllerSelecionarJogadorBase.totalSelecionado'))
      .value;
  Computed<ObservableList<Jogador>> _$naoSelecionadosComputed;

  @override
  ObservableList<Jogador> get naoSelecionados => (_$naoSelecionadosComputed ??=
          Computed<ObservableList<Jogador>>(() => super.naoSelecionados,
              name: '_ControllerSelecionarJogadorBase.naoSelecionados'))
      .value;

  final _$selecionadosAtom =
      Atom(name: '_ControllerSelecionarJogadorBase.selecionados');

  @override
  ObservableList<Jogador> get selecionados {
    _$selecionadosAtom.reportRead();
    return super.selecionados;
  }

  @override
  set selecionados(ObservableList<Jogador> value) {
    _$selecionadosAtom.reportWrite(value, super.selecionados, () {
      super.selecionados = value;
    });
  }

  final _$todosAtom = Atom(name: '_ControllerSelecionarJogadorBase.todos');

  @override
  ObservableList<Jogador> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Jogador> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$filtradaAtom =
      Atom(name: '_ControllerSelecionarJogadorBase.filtrada');

  @override
  ObservableList<Jogador> get filtrada {
    _$filtradaAtom.reportRead();
    return super.filtrada;
  }

  @override
  set filtrada(ObservableList<Jogador> value) {
    _$filtradaAtom.reportWrite(value, super.filtrada, () {
      super.filtrada = value;
    });
  }

  final _$_ControllerSelecionarJogadorBaseActionController =
      ActionController(name: '_ControllerSelecionarJogadorBase');

  @override
  dynamic addJogador(Jogador j) {
    final _$actionInfo = _$_ControllerSelecionarJogadorBaseActionController
        .startAction(name: '_ControllerSelecionarJogadorBase.addJogador');
    try {
      return super.addJogador(j);
    } finally {
      _$_ControllerSelecionarJogadorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic _carregarLista() {
    final _$actionInfo = _$_ControllerSelecionarJogadorBaseActionController
        .startAction(name: '_ControllerSelecionarJogadorBase._carregarLista');
    try {
      return super._carregarLista();
    } finally {
      _$_ControllerSelecionarJogadorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic filtrar(String s) {
    final _$actionInfo = _$_ControllerSelecionarJogadorBaseActionController
        .startAction(name: '_ControllerSelecionarJogadorBase.filtrar');
    try {
      return super.filtrar(s);
    } finally {
      _$_ControllerSelecionarJogadorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaCheckbox(Jogador item, bool value) {
    final _$actionInfo = _$_ControllerSelecionarJogadorBaseActionController
        .startAction(name: '_ControllerSelecionarJogadorBase.atualizaCheckbox');
    try {
      return super.atualizaCheckbox(item, value);
    } finally {
      _$_ControllerSelecionarJogadorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selecionarTodos() {
    final _$actionInfo = _$_ControllerSelecionarJogadorBaseActionController
        .startAction(name: '_ControllerSelecionarJogadorBase.selecionarTodos');
    try {
      return super.selecionarTodos();
    } finally {
      _$_ControllerSelecionarJogadorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selecionados: ${selecionados},
todos: ${todos},
filtrada: ${filtrada},
totalSelecionado: ${totalSelecionado},
naoSelecionados: ${naoSelecionados}
    ''';
  }
}
