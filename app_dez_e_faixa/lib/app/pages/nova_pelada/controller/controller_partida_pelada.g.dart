// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_partida_pelada.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerPartidaPelada on _ControllerPartidaPeladaBase, Store {
  final _$partidaAtom = Atom(name: '_ControllerPartidaPeladaBase.partida');

  @override
  Partida get partida {
    _$partidaAtom.reportRead();
    return super.partida;
  }

  @override
  set partida(Partida value) {
    _$partidaAtom.reportWrite(value, super.partida, () {
      super.partida = value;
    });
  }

  final _$time1Atom = Atom(name: '_ControllerPartidaPeladaBase.time1');

  @override
  Time get time1 {
    _$time1Atom.reportRead();
    return super.time1;
  }

  @override
  set time1(Time value) {
    _$time1Atom.reportWrite(value, super.time1, () {
      super.time1 = value;
    });
  }

  final _$time2Atom = Atom(name: '_ControllerPartidaPeladaBase.time2');

  @override
  Time get time2 {
    _$time2Atom.reportRead();
    return super.time2;
  }

  @override
  set time2(Time value) {
    _$time2Atom.reportWrite(value, super.time2, () {
      super.time2 = value;
    });
  }

  final _$_ControllerPartidaPeladaBaseActionController =
      ActionController(name: '_ControllerPartidaPeladaBase');

  @override
  dynamic setTime1(dynamic value) {
    final _$actionInfo = _$_ControllerPartidaPeladaBaseActionController
        .startAction(name: '_ControllerPartidaPeladaBase.setTime1');
    try {
      return super.setTime1(value);
    } finally {
      _$_ControllerPartidaPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTime2(dynamic value) {
    final _$actionInfo = _$_ControllerPartidaPeladaBaseActionController
        .startAction(name: '_ControllerPartidaPeladaBase.setTime2');
    try {
      return super.setTime2(value);
    } finally {
      _$_ControllerPartidaPeladaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
partida: ${partida},
time1: ${time1},
time2: ${time2}
    ''';
  }
}
