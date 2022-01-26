
import 'package:starwars_app/layers/data/datasources/get_filme_datasource.dart';
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';
import 'package:starwars_app/layers/domain/repositories/get_filme_repository.dart';

class GetFilmeRepositoryImp implements GetFilmeRepository{
  final GetFilmeDataSource _getFilmeDataSource;
  GetFilmeRepositoryImp(this._getFilmeDataSource);

  @override
  Future<List<FilmeEntity>> call()  async {
    return  await _getFilmeDataSource();
  }

}