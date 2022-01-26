

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

class Inject{
  static void init (){
    GetIt getIt = GetIt.instance;
    //lazysingletom -> só é criado quando é chamado
    //core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());
    //datasources
    getIt.registerLazySingleton<GetFilmeDataSource>(() => GetFilmeRemoteDataSourceImp(getIt()));
    getIt.registerLazySingleton<GetPersonagemDataSource>(() => GetPersonagemRemoteDataSourceImp(getIt()));
    //repositories
    getIt.registerLazySingleton<GetFilmeRepository>(() => GetFilmeRepositoryImp(getIt()));
    getIt.registerLazySingleton<GetPersonagemRepository>(() => GetPersonagemRepositoryImp(getIt()));
    //usecases
    getIt.registerLazySingleton<GetFilmeUseCase>(() => GetFilmeUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetPersonagemUseCase>(() => GetPersonagemUseCaseImp(getIt()));
    //controlers
    //registerFatory -> toda vez que um controller for recuperado será gerado uma instancia nova
    getIt.registerFactory<FilmeController>(() => FilmeController(getIt(), getIt()));
  }
}