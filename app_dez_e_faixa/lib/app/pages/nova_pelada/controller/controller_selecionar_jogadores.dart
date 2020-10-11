import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:mobx/mobx.dart';
part 'controller_selecionar_jogadores.g.dart';

class ControllerSelecionarJogador = _ControllerSelecionarJogadorBase
    with _$ControllerSelecionarJogador;

abstract class _ControllerSelecionarJogadorBase with Store {
  final ControllerGlobalJogador global;

  bool selecionou = false;

  _ControllerSelecionarJogadorBase({this.global}) {
    autorun((_) {
      _carregarLista();
    });
  }
  @action
  addJogador(Jogador j) {
    j.isSelected = true;
    global.addJogador(j);
    filtrada.add(j);
  }

  @observable
  ObservableList<Jogador> selecionados = ObservableList<Jogador>();

  @observable
  ObservableList<Jogador> todos = ObservableList<Jogador>();

  @observable
  ObservableList<Jogador> filtrada = ObservableList<Jogador>();

  @computed
  int get totalSelecionado => selecionados.length;

  @computed
  ObservableList<Jogador> get naoSelecionados =>
      todos.where((element) => !element.isSelected).toList().asObservable();

  @action
  _carregarLista() {
    todos = global.listaJogadores;
    todos.forEach((element) {
      element.isSelected = false;
    });
    filtrada = todos;
  }

  @action
  filtrar(String s) {
    print(s);
    filtrada = todos
        .where(
            (element) => element.nome.toLowerCase().contains(s.toLowerCase()))
        .toList()
        .asObservable();
  }

  @action
  atualizaCheckbox(Jogador item, bool value) {
    item.setCheck(value);
    item.getIsSelected ? selecionados.add(item) : selecionados.remove(item);
    selecionados.asObservable();
  }

  @action
  selecionarTodos() {
    if (selecionou) {
      filtrada.forEach((element) {
        atualizaCheckbox(element, false);
      });
      selecionou = false;
    } else {
      filtrada.forEach((element) {
        // ignore: unnecessary_statements
        element.isSelected == true ? null : atualizaCheckbox(element, true);
      });
      selecionou = true;
    }
  }

  getSize() => todos.length;
}
