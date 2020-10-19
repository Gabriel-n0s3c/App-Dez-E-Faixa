import 'package:app_dez_e_faixa/app/db/jogador_dao.dart';
import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:mobx/mobx.dart';
part 'controller_estatisticas.g.dart';

class ControllerEstatisticas = _ControllerEstatisticasBase
    with _$ControllerEstatisticas;

abstract class _ControllerEstatisticasBase with Store {
  _ControllerEstatisticasBase() {
    _carregarArtilheiros();
    _carregarAssistencias();
  }
  @observable
  ObservableList<Jogador> artilheiros = ObservableList<Jogador>();

  @observable
  ObservableList<Jogador> assistencias = ObservableList<Jogador>();

  @action
  _carregarArtilheiros() {
    JogadorDAO dao = JogadorDAO();
    dao.getArtillharia().then((value) => {
          artilheiros = value.asObservable(),
          print(
            artilheiros.toString(),
          )
        });
  }

  @action
  _carregarAssistencias() {
    JogadorDAO dao = JogadorDAO();
    dao.getAssistencia().then((value) => {
          assistencias = value.asObservable(),
          print(
            assistencias.toString(),
          )
        });
  }
}
