import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

abstract class GetPersonagemDataSource{
  Future<List<PersonagemEntity>> call();
}