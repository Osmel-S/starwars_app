import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

abstract class GetPersonagemUseCase {
  Future<List<PersonagemEntity>> call();
}
