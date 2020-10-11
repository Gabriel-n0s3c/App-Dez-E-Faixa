import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/model/partida.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:mobx/mobx.dart';

part 'controller_partida_pelada.g.dart';

class ControllerPartidaPelada = _ControllerPartidaPeladaBase
    with _$ControllerPartidaPelada;

abstract class _ControllerPartidaPeladaBase with Store {
  final ControllerListarTimesPelada controllerListarTimesPelada;

  _ControllerPartidaPeladaBase({this.controllerListarTimesPelada});

  @observable
  Partida partida;

  @observable
  ObservableList<Jogador> time1;

  @observable
  ObservableList<Jogador> time2;

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
