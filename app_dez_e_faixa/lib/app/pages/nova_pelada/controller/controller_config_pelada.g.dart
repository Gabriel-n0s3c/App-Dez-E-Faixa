// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_config_pelada.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerConfigPelada on _ControllerConfigPeladaBase, Store {
  final _$tempoAtom = Atom(name: '_ControllerConfigPeladaBase.tempo');

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

  final _$placarMaximoAtom =
      Atom(name: '_ControllerConfigPeladaBase.placarMaximo');

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

  final _$qtdPorTimeAtom = Atom(name: '_ControllerConfigPeladaBase.qtdPorTime');

  @override
  int get qtdPorTime {
    _$qtdPorTimeAtom.reportRead();
    return super.qtdPorTime;
  }

  @override
  set qtdPorTime(int value) {
    _$qtdPorTimeAtom.reportWrite(value, super.qtdPorTime, () {
      super.qtdPorTime = value;
    });
  }

  final _$definirTimesAtom =
      Atom(name: '_ControllerConfigPeladaBase.definirTimes');

  @override
  int get definirTimes {
    _$definirTimesAtom.reportRead();
    return super.definirTimes;
  }

  @override
  set definirTimes(int value) {
    _$definirTimesAtom.reportWrite(value, super.definirTimes, () {
      super.definirTimes = value;
    });
  }

  final _$_ControllerConfigPeladaBaseActionController =
      ActionController(name: '_ControllerConfigPeladaBase');

  @override
  dynamic setTempo(int value) {
    final _$actionInfo = _$_ControllerConfigPeladaBaseActionController
        .startAction(name: '_ControllerConfigPeladaBase.setTempo');
    try {
      return super.setTempo(value);
    } finally {
      _$_ControllerConfigPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlacarMaximo(int value) {
    final _$actionInfo = _$_ControllerConfigPeladaBaseActionController
        .startAction(name: '_ControllerConfigPeladaBase.setPlacarMaximo');
    try {
      return super.setPlacarMaximo(value);
    } finally {
      _$_ControllerConfigPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantidadePorTime(int value) {
    final _$actionInfo = _$_ControllerConfigPeladaBaseActionController
        .startAction(name: '_ControllerConfigPeladaBase.setQuantidadePorTime');
    try {
      return super.setQuantidadePorTime(value);
    } finally {
      _$_ControllerConfigPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaRadioButton(int numero) {
    final _$actionInfo = _$_ControllerConfigPeladaBaseActionController
        .startAction(name: '_ControllerConfigPeladaBase.atualizaRadioButton');
    try {
      return super.atualizaRadioButton(numero);
    } finally {
      _$_ControllerConfigPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tempo: ${tempo},
placarMaximo: ${placarMaximo},
qtdPorTime: ${qtdPorTime},
definirTimes: ${definirTimes}
    ''';
  }
}
