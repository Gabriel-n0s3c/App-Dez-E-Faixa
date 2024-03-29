import 'package:app_dez_e_faixa/app/db/jogador_dao.dart';
import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:mobx/mobx.dart';
part 'controller_global_jogador.g.dart';

class ControllerGlobalJogador = _ControllerGlobalJogadorBase
    with _$ControllerGlobalJogador;

abstract class _ControllerGlobalJogadorBase with Store {
  @observable
  ObservableList<Jogador> listaJogadores = ObservableList<Jogador>();

  _ControllerGlobalJogadorBase() {
    _carregarLista();

    autorun((_) {});
  }

  @action
  _carregarLista() {
    JogadorDAO dao = JogadorDAO();
    dao.getJogadores().then((value) {
      value.forEach((element) {
        element.isSelected = false;
      });
      listaJogadores = value.asObservable();
    });

    dao.getArtillharia();
  }

  @action
  addJogador(Jogador j) {
    JogadorDAO dao = JogadorDAO();
    dao.insertJogador(j);
    _carregarLista();
  }

  @action
  atualizarJogador(Jogador j) {
    JogadorDAO dao = JogadorDAO();
    dao.updateJogador(j);
    _carregarLista();
  }

  @action
  excluirJogador(Jogador j) {
    JogadorDAO dao = JogadorDAO();
    dao.deleteJogador(j.getId);
    _carregarLista();
  }

  @action
  addGolJogador(Jogador j) {
    JogadorDAO dao = JogadorDAO();
    dao.golJogador(j);
    _carregarLista();
    print(j.gols);
  }

  @action
  addAssitencia(Jogador j) {
    JogadorDAO dao = JogadorDAO();
    dao.assistenciaJogador(j);
    _carregarLista();
    print(listaJogadores);
  }

  getSize() => listaJogadores.length;
}
