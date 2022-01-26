
import 'package:starwars_app/layers/core/domain/services/http_service.dart';
import 'package:starwars_app/layers/data/datasources/get_personagem_datasource.dart';
import 'package:starwars_app/layers/data/dto/personagem_entity_dto.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

class GetPersonagemRemoteDataSourceImp implements GetPersonagemDataSource{
  HttpService _httpService;
  GetPersonagemRemoteDataSourceImp(this._httpService);

  @override
  Future<List<PersonagemEntity>> call() async {

    List<PersonagemEntity> list = [];
    try {
      var response = await _httpService.get('https://swapi.dev/api/people/');

      Iterable lista = response.data['results'];
      list = lista.map((e) => PersonagemEntityDto.fromMap(e)).toList();

      return list;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}