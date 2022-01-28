import 'package:starwars_app/layers/core/data/services/sqflite_service.dart';
import 'package:starwars_app/layers/data/dto/favorito_entity_dto.dart';
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecases.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase.dart';

class FilmeController {
  final GetFilmeUseCase _getFilmeUseCase;
  final GetPersonagemUseCase _getPersonagemUseCase;
  List<bool> _favoritos = [];
  List<bool> _favoritos2 = [];
  List<Favorito> listaEntidadeFavorito = [];
  List<FilmeEntity> filmeEntity = [];
  List<PersonagemEntity> personagemEntity = [];
  List<String> _listPersonagensFavoritos = [];

  FilmeController(this._getFilmeUseCase, this._getPersonagemUseCase);

  Future<List<FilmeEntity>> getFilme() async {
    filmeEntity = await _getFilmeUseCase();
    return filmeEntity;
  }

  Future<List<PersonagemEntity>> getPersonagens() async {
    personagemEntity = await _getPersonagemUseCase();
    return personagemEntity;
  }

  void adcionarPersonagemFavorito(String nome) {
    _listPersonagensFavoritos.add(nome);
    BancoDadosHelper.instance.adionarString(toMapString(nome));
  }

  void removerPersonagemFavorito(String nome) {
    _listPersonagensFavoritos.remove(nome);
    BancoDadosHelper.instance.remover(nome);
  }

  Map<String, String> toMapString(String nome) {
    return {'nome': nome};
  }
  static String fromMapString(Map<String, dynamic> json) {
    return  json['nome']!;
  }



  List<String> filtrandoLista() {
    List<String> filtroListaPersonagem = [];
    BancoDadosHelper.instance.recuperarFavoritos().then((value) => print('filter: $value'));


    List<String> baseList = personagemEntity.map((e) => e.nome).toList();

    for (var test in baseList) {
      if (_listPersonagensFavoritos.contains(test)) {
        print('contem' + test);
        filtroListaPersonagem.add(test);
        //recuperandoPersonagensFavoritos.remove(test);

      }
    }
    // print(_listPersonagensFavoritos.contains('Luke Skywalker'));
    //print("filtro $filtroList");
    print(filtroListaPersonagem);
    return filtroListaPersonagem;
  }



  List<String> get recuperandoPersonagensFavoritos {
    return _listPersonagensFavoritos;
  }

  List<bool> listFavoritos() {
    if (_favoritos.isEmpty)
      _favoritos =
          List<bool>.generate(personagemEntity.length, (index) => false);
    return _favoritos;
  }

  List<bool> listFavoritos2() {
    if (_favoritos2.isEmpty)
      _favoritos2 = List<bool>.generate(filmeEntity.length, (index) => false);
    return _favoritos2;
  }
}
