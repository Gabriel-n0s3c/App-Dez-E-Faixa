import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:mobx/mobx.dart';
part 'time.g.dart';

class Time = _TimeBase with _$Time;

abstract class _TimeBase with Store {
  @observable
  String nomeTime;

  @observable
  ObservableList<Jogador> jogadores = ObservableList<Jogador>();

  @observable
  bool isSelected;

  @action
  setNomeTime(String nome) {
    nomeTime = nome;
  }

  @action
  setCheck(bool value) {
    isSelected = value;
  }

  _TimeBase({this.isSelected, this.nomeTime, this.jogadores});
}
