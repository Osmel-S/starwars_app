import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';



class BancoDadosHelper {
  BancoDadosHelper._construtorPrivado();

  static final BancoDadosHelper instance = BancoDadosHelper._construtorPrivado();
  static Database? _db;
  int t = 0;
  Future<Database> get database async => _db ?? await _iniciarBanco();

  Future<Database> _iniciarBanco() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String caminho = join(docDirectory.path, 'favoritos.db');
    return await openDatabase(caminho, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE favoritos(nome TEXT)');
  }
  //  .execute('CREATE TABLE favoritos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)');
  // Future<List<Favorito>> recuperarFavoritos() async {
  //   Database db = await instance.database;
  //   var favoritos = await db.query('favoritos', orderBy: 'nome');
  //   List<Favorito> favoritosList = favoritos.isNotEmpty
  //       ? favoritos.map((e) => Favorito.fromMap(e)).toList()
  //       : [];
  //   print(favoritosList);
  //   return favoritosList;
  // }
  int? setTamanhoLista(int t){
    this.t = t;
  }

  Future<List<String>> recuperarFavoritos() async {
    Database db = await instance.database;
    var favoritos = await db.query('favoritos', orderBy: 'nome');

    List<String> lista =  favoritos.map((e) => FilmeController.fromMapString(e)).toList();

    setTamanhoLista(lista.length);

    return lista;
  }

  // Future<int> adionar(Favorito favorito) async {
  //   Database db = await instance.database;
  //   return await db.insert('favoritos', favorito.toMap());
  // }

  Future<int> adionarString(Map<String,String> string) async {
    Database db = await instance.database;
    return await db.insert('favoritos', string);
  }
  // Future<int> remover(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('favoritos', where: 'id = ?', whereArgs: [id]);
  // }

  Future<int> remover(String name) async {
    Database db = await instance.database;
    return await db.delete('favoritos', where: 'nome = ?', whereArgs: [name]);
  }
}
