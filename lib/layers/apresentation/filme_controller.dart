

import 'package:flutter/material.dart';
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecases.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase.dart';

class FilmeController {
  final GetFilmeUseCase _getFilmeUseCase;
  final GetPersonagemUseCase _getPersonagemUseCase;
  List<bool> _favoritos = [false,false,false,false,false,false,false,false,false,false,];


  List<FilmeEntity> filmeEntity = [];
  List<PersonagemEntity> personagemEntity = [];
  List<PersonagemEntity> _listPersonagensFavoritos = [];


  FilmeController(this._getFilmeUseCase, this._getPersonagemUseCase);

  Future<List<FilmeEntity>> getFilme() async {
    filmeEntity = await _getFilmeUseCase();
    return filmeEntity;
  }

  Future<List<PersonagemEntity>> getPersonagens() async {

    personagemEntity = await _getPersonagemUseCase();
    return personagemEntity;
  }

  void adicionandoPersonagemFavorito(PersonagemEntity personagem) {
    _listPersonagensFavoritos.add(personagem);
    print(personagem.nome);
  }
  void removendoPersonagemFavorito(PersonagemEntity personagem) {
    _listPersonagensFavoritos.remove(personagem);
  }



  get recuperandoPersonagensFavoritos {
    return _listPersonagensFavoritos;
  }

  List<bool> listFavoritos(){
   // if(_favoritos.isEmpty)  _favoritos =  List<bool>.generate(personagemEntity.length, (index) => false);
    return _favoritos;
  }


}
