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
  String msgGanhador = "";

  @observable
  int ganhador = 0;

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
    msgGanhador = "Não houve ganhador";
    ganhador = 0;
  }

  @action
  vitoriaTime(String nomeTime, int numeroTime) {
    resultado = "Vitória - $nomeTime";
    msgGanhador = "Vitória - $nomeTime";
    ganhador = numeroTime;
  }

  _PartidaBase(
      {this.placarTime1,
      this.placarTime2,
      this.tempoInSeconds,
      this.placarMax});
}
