import 'package:starwars_app/layers/core/domain/services/http_service.dart';
import 'package:starwars_app/layers/data/datasources/get_filme_datasource.dart';
import 'package:starwars_app/layers/data/dto/filme_entity_dto.dart';
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';

class GetFilmeRemoteDataSourceImp implements GetFilmeDataSource {
  HttpService _httpService;

  GetFilmeRemoteDataSourceImp(this._httpService);

  @override
  Future<List<FilmeEntity>> call() async {
    List<FilmeEntity> list = [];
    try {
      
      var response = await _httpService.get('https://swapi.dev/api/films/');
      Iterable lista = response.data['results'];
      list = lista.map((e) => FilmeEntityDto.fromMap(e)).toList();

      return list;
    } catch (e) {
      print(" catch requisição");
      print(e.toString());
      return [];
    }
  }
}
