import 'package:mobx/mobx.dart';
part 'controller_partida_rapida.g.dart';

class ControllerPartidaRapida = _ControllerPartidaRapidaBase
    with _$ControllerPartidaRapida;

abstract class _ControllerPartidaRapidaBase with Store {
  @observable
  String nomeTime1 = "Time 1";

  @observable
  String nomeTime2 = "Time 2";

  @observable
  String ganhador = "";

  @observable
  String resultado = "";

  int controlaQuemGanha = 0;

  @observable
  bool exibirMensagem = false;

  @observable
  int tempo;

  @observable
  int placarTime1 = 0;

  @observable
  int placarTime2 = 0;

  @observable
  int placarMaximo;

  @action
  setNomeTime1(String value) {
    if (value == "" || value.isEmpty) {
      nomeTime1 = "Nome Time 1";
    } else {
      nomeTime1 = value;
    }
  }

  @action
  setNomeTime2(String value) {
    if (value == "" || value.isEmpty) {
      nomeTime2 = "Nome Time 2";
    } else {
      nomeTime2 = value;
    }
  }

  @action
  setTempo(int value) {
    tempo = value;
  }

  @action
  setPlacarMax(int value) {
    placarMaximo = value;
  }

  @action
  setExibirMsg(bool value) {
    exibirMensagem = value;
  }

  @action
  somarPlacar1() {
    placarTime1++;
    verificarGanhador();
  }

  @action
  somarPlacar2() {
    placarTime2++;
    verificarGanhador();
  }

  @action
  reiniciarPlacar() {
    placarTime1 = 0;
    placarTime2 = 0;
    controlaQuemGanha = 0;
    exibirMensagem = false;
  }

  @action
  verificarGanhador({int t = 5}) {
    if (t == 1 && controlaQuemGanha == 0) {
      controlaQuemGanha++;
      if (placarTime1 == placarTime2) {
        resultado = "Empate!";
        ganhador = "Empate!";
        exibirMensagem = true;
      } else if (placarTime1 > placarTime2) {
        resultado = "Vitória!";
        ganhador = "$nomeTime1 ganhou!";
        exibirMensagem = true;
      } else if (placarTime2 > placarTime1) {
        resultado = "Vitória!";
        ganhador = "$nomeTime2 ganhou!";
        exibirMensagem = true;
      }
    } else {
      if (placarTime1 == placarMaximo) {
        resultado = "Vitória!";
        ganhador = "$nomeTime1 ganhou!";
        exibirMensagem = true;
      } else if (placarTime2 == placarMaximo) {
        resultado = "Vitória!";
        ganhador = "$nomeTime2 ganhou!";
        setExibirMsg(true);
      }
    }
  }

  int getTempo() {
    switch (tempo) {
      case 1:
        return 60;
        break;
      case 2:
        return 120;
        break;
      case 5:
        return 300;
        break;
      case 10:
        return 600;
        break;
      case 15:
        return 900;
        break;
      case 30:
        return 1800;
        break;
      default:
        return 0;
    }
  }

  @computed
  bool get verifica => tempo != null && placarMaximo != null;
}
