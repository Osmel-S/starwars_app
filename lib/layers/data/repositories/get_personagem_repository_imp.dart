import 'package:starwars_app/layers/data/datasources/get_personagem_datasource.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';
import 'package:starwars_app/layers/domain/repositories/get_personagem_repository.dart';

class GetPersonagemRepositoryImp implements GetPersonagemRepository {
  final GetPersonagemDataSource _getPersonagemDataSource;
  GetPersonagemRepositoryImp(this._getPersonagemDataSource);
  @override
  Future<List<PersonagemEntity>> call() {
    return _getPersonagemDataSource();
  }
}
