import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:mobx/mobx.dart';
part 'time.g.dart';

class Time = _TimeBase with _$Time;

abstract class _TimeBase with Store {
  @observable
  String nomeTime;

  @observable
  ObservableList<Jogador> jogadores = ObservableList<Jogador>();

  @action
  setNomeTime(String nome) {
    nomeTime = nome;
  }

  _TimeBase({this.nomeTime, this.jogadores});
}
