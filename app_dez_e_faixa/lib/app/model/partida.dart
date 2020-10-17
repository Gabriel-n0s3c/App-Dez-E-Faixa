import 'package:app_dez_e_faixa/app/model/time.dart';
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
  Time ganhador;

  @observable
  Time time1;

  @observable
  Time time2;

  @observable
  int nGanhador;

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
  }

  @action
  vitoriaTime(Time time, int numeroTime) {
    ganhador = time;
    nGanhador = numeroTime;

    resultado = "Vitória ";
    msgGanhador = "Vitória - ${ganhador.nomeTime}";
  }

  _PartidaBase({
    this.placarTime1,
    this.placarTime2,
    this.tempoInSeconds,
    this.placarMax,
    this.time1,
    this.time2,
  });
}
