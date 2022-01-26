
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';
import 'package:starwars_app/layers/domain/repositories/get_filme_repository.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecases.dart';

class GetFilmeUseCaseImp implements GetFilmeUseCase{

  final GetFilmeRepository _getFilmeRepository;
  GetFilmeUseCaseImp(this._getFilmeRepository);

  @override
  Future<List<FilmeEntity>> call() async  {
    return  await _getFilmeRepository();
  }

}