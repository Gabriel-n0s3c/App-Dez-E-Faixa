// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_listar_times_pelada.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerListarTimesPelada on _ControllerListarTimesPeladaBase, Store {
  Computed<dynamic> _$getSizeComputed;

  @override
  dynamic get getSize =>
      (_$getSizeComputed ??= Computed<dynamic>(() => super.getSize,
              name: '_ControllerListarTimesPeladaBase.getSize'))
          .value;

  final _$timesSelecionadosAtom =
      Atom(name: '_ControllerListarTimesPeladaBase.timesSelecionados');

  @override
  ObservableList<Time> get timesSelecionados {
    _$timesSelecionadosAtom.reportRead();
    return super.timesSelecionados;
  }

  @override
  set timesSelecionados(ObservableList<Time> value) {
    _$timesSelecionadosAtom.reportWrite(value, super.timesSelecionados, () {
      super.timesSelecionados = value;
    });
  }

  final _$timesAtom = Atom(name: '_ControllerListarTimesPeladaBase.times');

  @override
  ObservableList<Time> get times {
    _$timesAtom.reportRead();
    return super.times;
  }

  @override
  set times(ObservableList<Time> value) {
    _$timesAtom.reportWrite(value, super.times, () {
      super.times = value;
    });
  }

  final _$historicoPartidasAtom =
      Atom(name: '_ControllerListarTimesPeladaBase.historicoPartidas');

  @override
  ObservableList<Partida> get historicoPartidas {
    _$historicoPartidasAtom.reportRead();
    return super.historicoPartidas;
  }

  @override
  set historicoPartidas(ObservableList<Partida> value) {
    _$historicoPartidasAtom.reportWrite(value, super.historicoPartidas, () {
      super.historicoPartidas = value;
    });
  }

  final _$separarTimesAsyncAction =
      AsyncAction('_ControllerListarTimesPeladaBase.separarTimes');

  @override
  Future<ObservableList<Time>> separarTimes() {
    return _$separarTimesAsyncAction.run(() => super.separarTimes());
  }

  final _$separadoAsyncAction =
      AsyncAction('_ControllerListarTimesPeladaBase.separado');

  @override
  Future<void> separado() {
    return _$separadoAsyncAction.run(() => super.separado());
  }

  final _$_ControllerListarTimesPeladaBaseActionController =
      ActionController(name: '_ControllerListarTimesPeladaBase');

  @override
  dynamic setNomeTime({String value, int index}) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.setNomeTime');
    try {
      return super.setNomeTime(value: value, index: index);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addJogador(Jogador j, dynamic indexTime) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.addJogador');
    try {
      return super.addJogador(j, indexTime);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic addTime(int tamanho) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.addTime');
    try {
      return super.addTime(tamanho);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeJogador(Jogador j, int indexTime) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.removeJogador');
    try {
      return super.removeJogador(j, indexTime);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic removerTime(int index) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.removerTime');
    try {
      return super.removerTime(index);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic naoSepararTimes() {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.naoSepararTimes');
    try {
      return super.naoSepararTimes();
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaCheckbox(Time item, bool value) {
    final _$actionInfo = _$_ControllerListarTimesPeladaBaseActionController
        .startAction(name: '_ControllerListarTimesPeladaBase.atualizaCheckbox');
    try {
      return super.atualizaCheckbox(item, value);
    } finally {
      _$_ControllerListarTimesPeladaBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timesSelecionados: ${timesSelecionados},
times: ${times},
historicoPartidas: ${historicoPartidas},
getSize: ${getSize}
    ''';
  }
}
