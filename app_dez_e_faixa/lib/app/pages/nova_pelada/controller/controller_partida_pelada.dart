import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/model/partida.dart';
import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:mobx/mobx.dart';

part 'controller_partida_pelada.g.dart';

class ControllerPartidaPelada = _ControllerPartidaPeladaBase
    with _$ControllerPartidaPelada;

abstract class _ControllerPartidaPeladaBase with Store {
  final ControllerListarTimesPelada controllerListarTimesPelada;

  _ControllerPartidaPeladaBase({
    this.controllerListarTimesPelada,
  }) {
    time1 = controllerListarTimesPelada.timesSelecionados[0];
    time2 = controllerListarTimesPelada.timesSelecionados[1];

    partida = Partida(
        placarMax: controllerListarTimesPelada.configPelada.placarMaximo,
        placarTime1: 0,
        placarTime2: 0,
        tempoInSeconds: controllerListarTimesPelada.configPelada.tempo * 60);
  }

  @observable
  Partida partida;

  @observable
  Time time1;

  @observable
  Time time2;

  int controlaQuemGanha = 0;

  @observable
  bool exibirMensagem = false;

  @action
  setTime1(value) {
    time1 = value;
  }

  @action
  setTime2(value) {
    time2 = value;
  }

  @action
  golJogador({int time, Jogador jogador}) {
    controllerListarTimesPelada.configPelada.selecionarJogador.global
        .addGolJogador(jogador);
    time == 1 ? golTime1() : golTime2();
    // jogador.gol();
  }

  @action
  assistenciaJogador({int time, Jogador jogador}) {
    controllerListarTimesPelada.configPelada.selecionarJogador.global
        .addAssitencia(jogador);
    // jogador.gol();
  }

  @action
  golTime1() {
    partida.golTime1();
    verificarGanhador();
  }

  @action
  golTime2() {
    partida.golTime2();
    verificarGanhador();
  }

  @action
  reiniciarPlacar() {
    partida.placarTime1 = 0;
    partida.placarTime2 = 0;
    controlaQuemGanha = 0;
    exibirMensagem = false;
  }

  @action
  verificarGanhador({int t = 5}) {
    if (t == 1 && controlaQuemGanha == 0) {
      controlaQuemGanha++;
      if (partida.placarTime1 == partida.placarTime2) {
        partida.empate();
        exibirMensagem = true;
      } else if (partida.placarTime1 > partida.placarTime2) {
        partida.vitoriaTime(time1.nomeTime, 1);
        exibirMensagem = true;
      } else if (partida.placarTime2 > partida.placarTime1) {
        partida.vitoriaTime(time2.nomeTime, 2);
        exibirMensagem = true;
      }
    } else {
      if (partida.placarTime1 == partida.placarMax) {
        partida.vitoriaTime(time1.nomeTime, 1);
        exibirMensagem = true;
      } else if (partida.placarTime2 == partida.placarMax) {
        partida.vitoriaTime(time2.nomeTime, 2);
        exibirMensagem = true;
      }
    }
  }

  finalizarPartida() {
    try {
      if (partida.ganhador == 1) {
        controllerListarTimesPelada.times
            .removeWhere((element) => element == time2);

        controllerListarTimesPelada.atualizaCheckbox(time2, false);
        controllerListarTimesPelada.times.add(time2);
      } else if (partida.ganhador == 2) {
        controllerListarTimesPelada.times
            .removeWhere((element) => element == time1);
        controllerListarTimesPelada.atualizaCheckbox(time1, false);

        controllerListarTimesPelada.times.add(time1);
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
