import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/core/data/services/dio_http_service_imp.dart';
import 'package:starwars_app/layers/core/domain/services/http_service.dart';
import 'package:starwars_app/layers/data/datasources/get_filme_datasource.dart';
import 'package:starwars_app/layers/data/datasources/get_personagem_datasource.dart';
import 'package:starwars_app/layers/data/datasources/remote/get_filme_remote_datasource.dart';
import 'package:starwars_app/layers/data/datasources/remote/get_personagem_remote_datasource.dart';
import 'package:starwars_app/layers/data/repositories/get_filme_repository_imp.dart';
import 'package:starwars_app/layers/data/repositories/get_personagem_repository_imp.dart';
import 'package:starwars_app/layers/domain/repositories/get_filme_repository.dart';
import 'package:starwars_app/layers/domain/repositories/get_personagem_repository.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecase_imp.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecases.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase_imp.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //core
    getIt.registerSingleton<HttpService>(DioHttpServiceImp());
    //datasources
    getIt.registerSingleton<GetFilmeDataSource>(
        GetFilmeRemoteDataSourceImp(getIt()));
    getIt.registerSingleton<GetPersonagemDataSource>(
        GetPersonagemRemoteDataSourceImp(getIt()));
    //repositories
    getIt.registerSingleton<GetFilmeRepository>(GetFilmeRepositoryImp(getIt()));
    getIt.registerSingleton<GetPersonagemRepository>(
        GetPersonagemRepositoryImp(getIt()));
    //usecases
    getIt.registerSingleton<GetFilmeUseCase>(GetFilmeUseCaseImp(getIt()));
    getIt.registerSingleton<GetPersonagemUseCase>(
        GetPersonagemUseCaseImp(getIt()));
    //controlers
    getIt.registerSingleton<FilmeController>(FilmeController(getIt(), getIt()));
  }
}
