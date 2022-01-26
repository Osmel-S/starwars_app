import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

abstract class GetPersonagemRepository {
  Future<List<PersonagemEntity>> call();
}
