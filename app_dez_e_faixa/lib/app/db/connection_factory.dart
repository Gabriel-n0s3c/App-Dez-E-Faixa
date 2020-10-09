import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionFactory {
  static ConnectionFactory _connectionFactory;
  static Database _db;

  static getDatabase() {
    return _db;
  }

//usada para definir as colunas da tabeala
  String jogadorTable = 'jogadores';
  String colId = 'id';
  String colNome = 'nome';

  //construtor nomeado para criar instância da classe
  ConnectionFactory._createInstance();

  factory ConnectionFactory() {
    if (_connectionFactory == null) {
      // executado somente uma vez
      _connectionFactory = ConnectionFactory._createInstance();
    }
    return _connectionFactory;
  }

  Future<Database> get database async {
    if (_db == null) {
      _db = await inicializarDatabase();
    }
    return _db;
  }

  Future<Database> inicializarDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'testeJogador.db';

    var contatosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return contatosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $jogadorTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colNome TEXT)');
  }

  /* Future<int> insertContato(Jogador jogador) async {
    Database db = await this.database;
    var resultado = await db.insert(jogadorTable, jogador.toMap());

    return resultado;
  } */

  Future close() async {
    Database db = await this.database;
    db.close();
  }

  void limparDataBase() {
    _db.execute("delete from $jogadorTable");
  }
}
