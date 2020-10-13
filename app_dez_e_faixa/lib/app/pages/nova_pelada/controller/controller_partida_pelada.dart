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
        placarTime1: 0,
        placarTime2: 0,
        tempo: controllerListarTimesPelada.configPelada.tempo);
  }

  @observable
  Partida partida;

  @observable
  Time time1;

  @observable
  Time time2;

  @observable
  @action
  setTime1(value) {
    time1 = value;
  }

  @action
  setTime2(value) {
    time2 = value;
  }
}
