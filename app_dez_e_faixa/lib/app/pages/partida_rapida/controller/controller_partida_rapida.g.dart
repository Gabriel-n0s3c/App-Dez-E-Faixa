// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_partida_rapida.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPartidaRapida on _ControllerPartidaRapidaBase, Store {
  Computed<bool> _$verificaComputed;

  @override
  bool get verifica =>
      (_$verificaComputed ??= Computed<bool>(() => super.verifica,
              name: '_ControllerPartidaRapidaBase.verifica'))
          .value;

  final _$nomeTime1Atom = Atom(name: '_ControllerPartidaRapidaBase.nomeTime1');

  @override
  String get nomeTime1 {
    _$nomeTime1Atom.reportRead();
    return super.nomeTime1;
  }

  @override
  set nomeTime1(String value) {
    _$nomeTime1Atom.reportWrite(value, super.nomeTime1, () {
      super.nomeTime1 = value;
    });
  }

  final _$nomeTime2Atom = Atom(name: '_ControllerPartidaRapidaBase.nomeTime2');

  @override
  String get nomeTime2 {
    _$nomeTime2Atom.reportRead();
    return super.nomeTime2;
  }

  @override
  set nomeTime2(String value) {
    _$nomeTime2Atom.reportWrite(value, super.nomeTime2, () {
      super.nomeTime2 = value;
    });
  }

  final _$ganhadorAtom = Atom(name: '_ControllerPartidaRapidaBase.ganhador');

  @override
  String get ganhador {
    _$ganhadorAtom.reportRead();
    return super.ganhador;
  }

  @override
  set ganhador(String value) {
    _$ganhadorAtom.reportWrite(value, super.ganhador, () {
      super.ganhador = value;
    });
  }

  final _$resultadoAtom = Atom(name: '_ControllerPartidaRapidaBase.resultado');

  @override
  String get resultado {
    _$resultadoAtom.reportRead();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.reportWrite(value, super.resultado, () {
      super.resultado = value;
    });
  }

  final _$exibirMensagemAtom =
      Atom(name: '_ControllerPartidaRapidaBase.exibirMensagem');

  @override
  bool get exibirMensagem {
    _$exibirMensagemAtom.reportRead();
    return super.exibirMensagem;
  }

  @override
  set exibirMensagem(bool value) {
    _$exibirMensagemAtom.reportWrite(value, super.exibirMensagem, () {
      super.exibirMensagem = value;
    });
  }

  final _$tempoAtom = Atom(name: '_ControllerPartidaRapidaBase.tempo');

  @override
  int get tempo {
    _$tempoAtom.reportRead();
    return super.tempo;
  }

  @override
  set tempo(int value) {
    _$tempoAtom.reportWrite(value, super.tempo, () {
      super.tempo = value;
    });
  }

  final _$placarTime1Atom =
      Atom(name: '_ControllerPartidaRapidaBase.placarTime1');

  @override
  int get placarTime1 {
    _$placarTime1Atom.reportRead();
    return super.placarTime1;
  }

  @override
  set placarTime1(int value) {
    _$placarTime1Atom.reportWrite(value, super.placarTime1, () {
      super.placarTime1 = value;
    });
  }

  final _$placarTime2Atom =
      Atom(name: '_ControllerPartidaRapidaBase.placarTime2');

  @override
  int get placarTime2 {
    _$placarTime2Atom.reportRead();
    return super.placarTime2;
  }

  @override
  set placarTime2(int value) {
    _$placarTime2Atom.reportWrite(value, super.placarTime2, () {
      super.placarTime2 = value;
    });
  }

  final _$placarMaximoAtom =
      Atom(name: '_ControllerPartidaRapidaBase.placarMaximo');

  @override
  int get placarMaximo {
    _$placarMaximoAtom.reportRead();
    return super.placarMaximo;
  }

  @override
  set placarMaximo(int value) {
    _$placarMaximoAtom.reportWrite(value, super.placarMaximo, () {
      super.placarMaximo = value;
    });
  }

  final _$_ControllerPartidaRapidaBaseActionController =
      ActionController(name: '_ControllerPartidaRapidaBase');

  @override
  dynamic setNomeTime1(String value) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.setNomeTime1');
    try {
      return super.setNomeTime1(value);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNomeTime2(String value) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.setNomeTime2');
    try {
      return super.setNomeTime2(value);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTempo(int value) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.setTempo');
    try {
      return super.setTempo(value);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlacarMax(int value) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.setPlacarMax');
    try {
      return super.setPlacarMax(value);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExibirMsg(bool value) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.setExibirMsg');
    try {
      return super.setExibirMsg(value);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic somarPlacar1() {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.somarPlacar1');
    try {
      return super.somarPlacar1();
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic somarPlacar2() {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.somarPlacar2');
    try {
      return super.somarPlacar2();
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reiniciarPlacar() {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.reiniciarPlacar');
    try {
      return super.reiniciarPlacar();
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic verificarGanhador({int t = 5}) {
    final _$actionInfo = _$_ControllerPartidaRapidaBaseActionController
        .startAction(name: '_ControllerPartidaRapidaBase.verificarGanhador');
    try {
      return super.verificarGanhador(t: t);
    } finally {
      _$_ControllerPartidaRapidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeTime1: ${nomeTime1},
nomeTime2: ${nomeTime2},
ganhador: ${ganhador},
resultado: ${resultado},
exibirMensagem: ${exibirMensagem},
tempo: ${tempo},
placarTime1: ${placarTime1},
placarTime2: ${placarTime2},
placarMaximo: ${placarMaximo},
verifica: ${verifica}
    ''';
  }
}
