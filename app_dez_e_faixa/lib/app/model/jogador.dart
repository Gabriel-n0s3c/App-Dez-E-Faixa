import 'package:mobx/mobx.dart';
part 'jogador.g.dart';

class Jogador = _JogadorBase with _$Jogador;

abstract class _JogadorBase with Store {
  int _id;

  @observable
  String nome;

  @observable
  bool isSelected;

  @action
  setNome(String value) => nome = value;

  @action
  setCheck(bool value) => isSelected = value;

  setId(int id) => _id = id;

  int get getId => this._id;

  _JogadorBase({String nome, this.isSelected = false}) {
    this.nome = nome;
    isSelected = false;
  }

  get getIsSelected => this.isSelected;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': _id,
      'nome': nome,
    };
    return map;
  }

  _JogadorBase.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    nome = map['nome'];
  }

  @override
  String toString() {
    return "Jogador => (id: $_id, nome: $nome)";
  }
}
