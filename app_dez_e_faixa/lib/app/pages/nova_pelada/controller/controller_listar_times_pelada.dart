import 'dart:async';

import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/model/partida.dart';
import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_config_pelada.dart';
import 'package:mobx/mobx.dart';
part 'controller_listar_times_pelada.g.dart';

class ControllerListarTimesPelada = _ControllerListarTimesPeladaBase
    with _$ControllerListarTimesPelada;

abstract class _ControllerListarTimesPeladaBase with Store {
  final ControllerConfigPelada configPelada;

  _ControllerListarTimesPeladaBase({this.configPelada}) {
    configPelada.definirTimes == 1
        ? Timer(Duration(milliseconds: 100), () => separado())
        : naoSepararTimes();
  }

  @observable
  ObservableList<Time> timesSelecionados = ObservableList<Time>();

  @observable
  ObservableList<Time> times = ObservableList<Time>();

  @observable
  ObservableList<Partida> historicoPartidas = ObservableList<Partida>();

  @computed
  get getSize => times.length;

  @action
  setNomeTime({String value, int index}) {
    value == null || value == ""
        // ignore: unnecessary_statements
        ? null
        : times.elementAt(index).setNomeTime(value);
    ObservableList<Time> t = ObservableList<Time>();
    t = times;
    times = t;
  }

  @action
  addJogador(Jogador j, indexTime) {
    if (j.getIsSelected == null && j.getId == null) {
      configPelada.selecionarJogador.addJogador(j);
    }

    j.setCheck(true);
    configPelada.selecionarJogador.selecionados.add(j);
    configPelada.selecionarJogador.naoSelecionados.remove(j);
    times[indexTime].jogadores.add(j);

    var t = ObservableList<Time>();
    t = times;
    times = t;
    t = null;
  }

  @action
  addTime(int tamanho) {
    if (tamanho == null) {
      tamanho = 0;
    }
    times.add(Time(
        nomeTime: "Time ${tamanho + 1}",
        jogadores: <Jogador>[].asObservable()));
  }

  @action
  removeJogador(Jogador j, int indexTime) {
    times[indexTime].jogadores.remove(j);
    configPelada.selecionarJogador.selecionados.remove(j);
    configPelada.selecionarJogador.naoSelecionados.add(j);
    j.setCheck(false);

    var t = ObservableList<Time>();
    t = times;
    times = t;
    t = null;
  }

  @action
  removerTime(int index) {
    print(index);

    times[index].jogadores.forEach((j) {
      print(j.nome);
      j.setCheck(false);
      configPelada.selecionarJogador.selecionados.remove(j);
    });

    times[index].jogadores.clear();
    times.removeAt(index);

    var t = ObservableList<Time>().asObservable();
    t = times;
    times = t;
    t = null;
  }

  @action
  Future<ObservableList<Time>> separarTimes() async {
    List<Jogador> selecionados = configPelada.selecionarJogador.selecionados;
    selecionados.shuffle();
    final ObservableList<Time> t = ObservableList<Time>();
    int j = 1;
    for (var i = 0; i < selecionados.length; i += configPelada.qtdPorTime) {
      t.add(Time(
          nomeTime: "Time $j",
          isSelected: false,
          jogadores: selecionados
              .sublist(
                  i,
                  i + configPelada.qtdPorTime > selecionados.length
                      ? selecionados.length
                      : i + configPelada.qtdPorTime)
              .asObservable()));
      j++;
    }
    return t;
  }

  @action
  Future<void> separado() async {
    if (configPelada.selecionarJogador.selecionados != null)
      times = await separarTimes();
  }

  @action
  naoSepararTimes() {
    configPelada.selecionarJogador.naoSelecionados.clear();
    configPelada.selecionarJogador.naoSelecionados
        .addAll(configPelada.selecionarJogador.selecionados);
  }

  @action
  atualizaCheckbox(Time item, bool value) {
    if (timesSelecionados.length < 2) {
      print("entrou ${timesSelecionados.length}");
      item.setCheck(value);
      item.isSelected
          ? timesSelecionados.add(item)
          : timesSelecionados.remove(item);
    } else {
      // ignore: unnecessary_statements
      item.isSelected ? timesSelecionados.remove(item) : null;
      item.setCheck(false);
    }
    var t = ObservableList<Time>();
    t = times;
    times = t;
    t = null;
  }
}
