import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/model/time.dart';
import 'package:app_dez_e_faixa/app/pages/nova_pelada/controller/controller_config_pelada.dart';
import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:mobx/mobx.dart';
part 'controller_listar_times_pelada.g.dart';

class ControllerListarTimesPelada = _ControllerListarTimesPeladaBase
    with _$ControllerListarTimesPelada;

abstract class _ControllerListarTimesPeladaBase with Store {
  final ControllerConfigPelada configPelada;
  final ControllerGlobalJogador global;

  _ControllerListarTimesPeladaBase({this.global, this.configPelada}) {
    separarTimes();
  }
  ObservableList<Time> timesSelecionados = ObservableList<Time>();

  @observable
  ObservableList<Time> times = ObservableList<Time>();

  @computed
  get getSize => times.length;

  @action
  setNomeTime({String value, int index}) {
    value == null || value == ""
        // ignore: unnecessary_statements
        ? null
        : times.elementAt(index).setNomeTime(value.toUpperCase());
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
  separarTimes() {
    List<Jogador> selecionados = configPelada.selecionarJogador.selecionados;
    selecionados.shuffle();

    for (var i = 0; i < selecionados.length; i += configPelada.qtdPorTime) {
      times.add(Time(
          nomeTime: null,
          isSelected: false,
          jogadores: selecionados
              .sublist(
                  i,
                  i + configPelada.qtdPorTime > selecionados.length
                      ? selecionados.length
                      : i + configPelada.qtdPorTime)
              .asObservable()));
    }
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
