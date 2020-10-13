// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Time on _TimeBase, Store {
  final _$nomeTimeAtom = Atom(name: '_TimeBase.nomeTime');

  @override
  String get nomeTime {
    _$nomeTimeAtom.reportRead();
    return super.nomeTime;
  }

  @override
  set nomeTime(String value) {
    _$nomeTimeAtom.reportWrite(value, super.nomeTime, () {
      super.nomeTime = value;
    });
  }

  final _$jogadoresAtom = Atom(name: '_TimeBase.jogadores');

  @override
  ObservableList<Jogador> get jogadores {
    _$jogadoresAtom.reportRead();
    return super.jogadores;
  }

  @override
  set jogadores(ObservableList<Jogador> value) {
    _$jogadoresAtom.reportWrite(value, super.jogadores, () {
      super.jogadores = value;
    });
  }

  final _$isSelectedAtom = Atom(name: '_TimeBase.isSelected');

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

  final _$_TimeBaseActionController = ActionController(name: '_TimeBase');

  @override
  dynamic setNomeTime(String nome) {
    final _$actionInfo =
        _$_TimeBaseActionController.startAction(name: '_TimeBase.setNomeTime');
    try {
      return super.setNomeTime(nome);
    } finally {
      _$_TimeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo =
        _$_TimeBaseActionController.startAction(name: '_TimeBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_TimeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeTime: ${nomeTime},
jogadores: ${jogadores},
isSelected: ${isSelected}
    ''';
  }
}
