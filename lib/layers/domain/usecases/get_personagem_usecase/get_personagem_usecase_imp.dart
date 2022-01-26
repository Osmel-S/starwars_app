import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';
import 'package:starwars_app/layers/domain/repositories/get_personagem_repository.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase.dart';

class GetPersonagemUseCaseImp implements GetPersonagemUseCase{
  final GetPersonagemRepository _getPersonagemRepository;
  GetPersonagemUseCaseImp(this._getPersonagemRepository);
  @override
  Future<List<PersonagemEntity>> call() async {
   return  await  _getPersonagemRepository();
  }

}