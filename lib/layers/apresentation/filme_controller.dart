import 'package:flutter/material.dart';
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecases.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase.dart';

class FilmeController {
  final GetFilmeUseCase _getFilmeUseCase;
  final GetPersonagemUseCase _getPersonagemUseCase;

  late List<FilmeEntity> filmeEntity;
  late List<PersonagemEntity> personagemEntity;

  FilmeController(this._getFilmeUseCase, this._getPersonagemUseCase);

  Future<List<FilmeEntity>> getFilme() async {
    filmeEntity = await _getFilmeUseCase();
    print('get $filmeEntity');
    return filmeEntity;
  }

  Future<List<PersonagemEntity>> getPersonagens() async {
    personagemEntity = await _getPersonagemUseCase();
    print('get $personagemEntity');
    return personagemEntity;
  }
}
