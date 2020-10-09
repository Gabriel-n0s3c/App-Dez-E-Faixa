import 'package:app_dez_e_faixa/app/provider/controller_global_jogador.dart';
import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:mobx/mobx.dart';
part 'controller_page_lista_jogadores.g.dart';

class ControllerPageListaJogador = _ControllerPageListaJogadorBase
    with _$ControllerPageListaJogador;

abstract class _ControllerPageListaJogadorBase with Store {
  final cntrlJogador = ControllerGlobalJogador();
  _ControllerPageListaJogadorBase() {
    autorun((_) {});
  }

  @action
  addJogador(Jogador j) {
    cntrlJogador.addJogador(j);
  }

  @action
  atualizarJogador(Jogador j) {
    cntrlJogador.atualizarJogador(j);
  }

  @action
  excluirJogador(Jogador j) {
    cntrlJogador.excluirJogador(j);
  }

  @observable
  int totalSelecionado = 0;

  getSize() => cntrlJogador.listaJogadores.length;
}
