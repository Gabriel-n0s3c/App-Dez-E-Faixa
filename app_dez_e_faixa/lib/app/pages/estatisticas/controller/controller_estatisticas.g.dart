// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_estatisticas.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerEstatisticas on _ControllerEstatisticasBase, Store {
  final _$artilheirosAtom =
      Atom(name: '_ControllerEstatisticasBase.artilheiros');

  @override
  ObservableList<Jogador> get artilheiros {
    _$artilheirosAtom.reportRead();
    return super.artilheiros;
  }

  @override
  set artilheiros(ObservableList<Jogador> value) {
    _$artilheirosAtom.reportWrite(value, super.artilheiros, () {
      super.artilheiros = value;
    });
  }

  final _$assistenciasAtom =
      Atom(name: '_ControllerEstatisticasBase.assistencias');

  @override
  ObservableList<Jogador> get assistencias {
    _$assistenciasAtom.reportRead();
    return super.assistencias;
  }

  @override
  set assistencias(ObservableList<Jogador> value) {
    _$assistenciasAtom.reportWrite(value, super.assistencias, () {
      super.assistencias = value;
    });
  }

  final _$_ControllerEstatisticasBaseActionController =
      ActionController(name: '_ControllerEstatisticasBase');

  @override
  dynamic _carregarArtilheiros() {
    final _$actionInfo = _$_ControllerEstatisticasBaseActionController
        .startAction(name: '_ControllerEstatisticasBase._carregarArtilheiros');
    try {
      return super._carregarArtilheiros();
    } finally {
      _$_ControllerEstatisticasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _carregarAssistencias() {
    final _$actionInfo = _$_ControllerEstatisticasBaseActionController
        .startAction(name: '_ControllerEstatisticasBase._carregarAssistencias');
    try {
      return super._carregarAssistencias();
    } finally {
      _$_ControllerEstatisticasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
artilheiros: ${artilheiros},
assistencias: ${assistencias}
    ''';
  }
}
