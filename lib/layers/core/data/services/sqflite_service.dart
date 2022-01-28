import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

class BancoDadosHelper {
  BancoDadosHelper._construtorPrivado();

  static final BancoDadosHelper instance =
      BancoDadosHelper._construtorPrivado();
  static Database? _db;
  int t = 0;

  Future<Database> get database async => _db ?? await _iniciarBanco();

  Future<Database> _iniciarBanco() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String caminho = join(docDirectory.path, 'favoritos.db');
    return await openDatabase(caminho, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE favoritos(nome TEXT, numero INTEGER)');
  }

  Future<List<String>> recuperarFavoritos() async {
    Database db = await instance.database;
    var favoritos = await db.query('favoritos', orderBy: 'nome');

    List<String> lista =
        favoritos.map((e) => FilmeController.fromMapString(e)).toList();

    return lista;
  }

  Future<List<int>> recuperarFavoritosEstado() async {
    Database db = await instance.database;
    var favoritos = await db.query('favoritos', orderBy: 'nome');
    List<int> lista =
        favoritos.map((e) => FilmeController.fromMapBool(e)).toList();

    return lista;
  }

  Future<int> adionarString(Map<String, dynamic> string) async {
    Database db = await instance.database;
    return await db.insert('favoritos', string);
  }

  Future<int> remover(String name) async {
    Database db = await instance.database;
    return await db.delete('favoritos', where: 'nome = ?', whereArgs: [name]);
  }
}
