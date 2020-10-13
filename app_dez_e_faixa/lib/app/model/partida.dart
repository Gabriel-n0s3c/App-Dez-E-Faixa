import 'package:mobx/mobx.dart';
part 'partida.g.dart';

class Partida = _PartidaBase with _$Partida;

abstract class _PartidaBase with Store {
  @observable
  int placarMax;

  @observable
  int placarTime1 = 0;

  @observable
  int placarTime2 = 0;

  @observable
  int tempo;

  @action
  golTime1() {
    placarTime1++;
  }

  _PartidaBase(
      {this.placarTime1, this.placarTime2, this.tempo, this.placarMax});
}
