import 'package:app_dez_e_faixa/app/model/jogador.dart';
import 'package:sqflite/sqflite.dart';
import 'connection_factory.dart';

class JogadorDAO {
  ConnectionFactory _cn = ConnectionFactory();
  String colId = 'id';
  String colNome = 'nome';

  //Incluir um objeto Jogador no banco de dados
  Future<int> insertJogador(Jogador jogador) async {
    Database db = await _cn.database;
    var resultado = await db.insert(_cn.jogadorTable, jogador.toMap());
    return resultado;
  }

  //retorna um Jogador pelo id
  Future<Jogador> getJogador(int id) async {
    Database db = await _cn.database;

    List<Map> maps = await db.query(_cn.jogadorTable,
        columns: [colId, colNome], where: "$colId = ?", whereArgs: [id]);

    if (maps.length > 0) {
      return Jogador.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Jogador>> getJogadores() async {
    Database db = await _cn.database;

    var resultado = await db.query(_cn.jogadorTable);

    List<Jogador> lista = resultado.isNotEmpty
        ? resultado.map((c) => Jogador.fromMap(c)).toList()
        : [];

    return lista;
  }

  //Atualizar o objeto Jogador e salva no banco de dados
  Future<int> updateJogador(Jogador jogador) async {
    Database db = await _cn.database;

    var resultado = await db.update(_cn.jogadorTable, jogador.toMap(),
        where: '$colId = ?', whereArgs: [jogador.getId]);

    return resultado;
  }

  //Deletar um objeto Jogador do banco de dados
  Future<int> deleteJogador(int id) async {
    var db = await _cn.database;

    int resultado =
        await db.delete(_cn.jogadorTable, where: "$colId = ?", whereArgs: [id]);

    return resultado;
  }

  //AUTOINCREMENTA GOL
  void golJogador(Jogador jogador) async {
    Database db = await _cn.database;
    // ignore: unused_local_variable
    int updateCount = await db.rawUpdate(
        '''UPDATE jogadores SET gols = gols + 1 WHERE id = ?''',
        [jogador.getId]);
  }

  //AUTOINCREMENTA ASSISTENCIA
  void assistenciaJogador(Jogador jogador) async {
    Database db = await _cn.database;

    db.execute(
        "UPDATE jogadores SET assistencias = assistencias + 1 WHERE id = ${jogador.getId}");
  }

//SELECIONAR JOGADORES ORDENADOS PELOS GOLS
  Future<List<Jogador>> getArtillharia() async {
    Database db = await _cn.database;

    var resultado =
        await db.rawQuery('''SELECT * FROM jogadores order by gols DESC;''');

    List<Jogador> lista = resultado.isNotEmpty
        ? resultado.map((c) => Jogador.fromMap(c)).toList()
        : [];

    return lista;
  }

//SELECIONAR JOGADORES ORDENADOS PELAS ASSISTENCIAS
  Future<List<Jogador>> getAssistencia() async {
    Database db = await _cn.database;

    var resultado = await db
        .rawQuery('''SELECT * FROM jogadores order by assistencias DESC;''');

    List<Jogador> lista = resultado.isNotEmpty
        ? resultado.map((c) => Jogador.fromMap(c)).toList()
        : [];

    return lista;
  }

//Obtem o número de objetos Jogador no banco de dados
  Future<int> getCount() async {
    Database db = await _cn.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from jogadores');

    int resultado = Sqflite.firstIntValue(x);
    return resultado;
  }
}
