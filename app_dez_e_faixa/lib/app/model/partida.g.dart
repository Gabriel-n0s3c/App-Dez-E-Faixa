// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partida.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Partida on _PartidaBase, Store {
  final _$placarMaxAtom = Atom(name: '_PartidaBase.placarMax');

  @override
  int get placarMax {
    _$placarMaxAtom.reportRead();
    return super.placarMax;
  }

  @override
  set placarMax(int value) {
    _$placarMaxAtom.reportWrite(value, super.placarMax, () {
      super.placarMax = value;
    });
  }

  final _$placarTime1Atom = Atom(name: '_PartidaBase.placarTime1');

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

  final _$placarTime2Atom = Atom(name: '_PartidaBase.placarTime2');

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

  final _$tempoInMinutesAtom = Atom(name: '_PartidaBase.tempoInMinutes');

  @override
  int get tempoInMinutes {
    _$tempoInMinutesAtom.reportRead();
    return super.tempoInMinutes;
  }

  @override
  set tempoInMinutes(int value) {
    _$tempoInMinutesAtom.reportWrite(value, super.tempoInMinutes, () {
      super.tempoInMinutes = value;
    });
  }

  final _$tempoInSecondsAtom = Atom(name: '_PartidaBase.tempoInSeconds');

  @override
  int get tempoInSeconds {
    _$tempoInSecondsAtom.reportRead();
    return super.tempoInSeconds;
  }

  @override
  set tempoInSeconds(int value) {
    _$tempoInSecondsAtom.reportWrite(value, super.tempoInSeconds, () {
      super.tempoInSeconds = value;
    });
  }

  final _$ganhadorAtom = Atom(name: '_PartidaBase.ganhador');

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

  final _$resultadoAtom = Atom(name: '_PartidaBase.resultado');

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

  final _$_PartidaBaseActionController = ActionController(name: '_PartidaBase');

  @override
  dynamic golTime1() {
    final _$actionInfo = _$_PartidaBaseActionController.startAction(
        name: '_PartidaBase.golTime1');
    try {
      return super.golTime1();
    } finally {
      _$_PartidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic golTime2() {
    final _$actionInfo = _$_PartidaBaseActionController.startAction(
        name: '_PartidaBase.golTime2');
    try {
      return super.golTime2();
    } finally {
      _$_PartidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic empate() {
    final _$actionInfo =
        _$_PartidaBaseActionController.startAction(name: '_PartidaBase.empate');
    try {
      return super.empate();
    } finally {
      _$_PartidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic vitoriaTime(String nomeTime) {
    final _$actionInfo = _$_PartidaBaseActionController.startAction(
        name: '_PartidaBase.vitoriaTime');
    try {
      return super.vitoriaTime(nomeTime);
    } finally {
      _$_PartidaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
placarMax: ${placarMax},
placarTime1: ${placarTime1},
placarTime2: ${placarTime2},
tempoInMinutes: ${tempoInMinutes},
tempoInSeconds: ${tempoInSeconds},
ganhador: ${ganhador},
resultado: ${resultado}
    ''';
  }
}
