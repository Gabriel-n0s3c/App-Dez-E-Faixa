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
  int tempoInMinutes;

  @observable
  int tempoInSeconds;

  @observable
  String ganhador = "";

  @observable
  String resultado = "";

  @action
  golTime1() {
    placarTime1++;
  }

  @action
  golTime2() {
    placarTime2++;
  }

  @action
  empate() {
    resultado = "Empate!";
    ganhador = "Não houve ganhador";
  }

  @action
  vitoriaTime(String nomeTime) {
    resultado = "Vitória - $nomeTime";
    ganhador = "Vitória - $nomeTime";
  }

  _PartidaBase(
      {this.placarTime1,
      this.placarTime2,
      this.tempoInSeconds,
      this.placarMax});
}
