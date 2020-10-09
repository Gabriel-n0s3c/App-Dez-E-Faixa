import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_selecionar_jogadores.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'controller_config_pelada.g.dart';

class ControllerConfigPelada = _ControllerConfigPeladaBase
    with _$ControllerConfigPelada;

abstract class _ControllerConfigPeladaBase with Store {
  _ControllerConfigPeladaBase({@required this.selecionarJogador});

  final ControllerSelecionarJogador selecionarJogador;
  @observable
  int tempo;

  @observable
  int placarMaximo;

  @observable
  int qtdPorTime;

  @observable
  int definirTimes;

  @action
  setTempo(int value) {
    tempo = value;
  }

  @action
  setPlacarMaximo(int value) {
    placarMaximo = value;
  }

  @action
  setQuantidadePorTime(int value) {
    qtdPorTime = value;
  }

  @action
  atualizaRadioButton(int numero) {
    definirTimes = numero;
  }

  bool verifica() {
    return tempo != null &&
        placarMaximo != null &&
        qtdPorTime != null &&
        definirTimes != null;
  }
}
