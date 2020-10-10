import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_listar_times_pelada.dart';
import 'package:mobx/mobx.dart';
part 'controller_partida_pelada.g.dart';

class ControllerPartidaPelada = _ControllerPartidaPeladaBase
    with _$ControllerPartidaPelada;

abstract class _ControllerPartidaPeladaBase with Store {
  final ControllerListarTimesPelada controllerListarTimesPelada;

  _ControllerPartidaPeladaBase({this.controllerListarTimesPelada});
}
