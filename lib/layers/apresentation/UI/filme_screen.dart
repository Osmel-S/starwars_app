import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/core/data/services/dio_http_service_imp.dart';
import 'package:starwars_app/layers/data/datasources/remote/get_filme_remote_datasource.dart';
import 'package:starwars_app/layers/data/datasources/remote/get_personagem_remote_datasource.dart';
import 'package:starwars_app/layers/data/repositories/get_filme_repository_imp.dart';
import 'package:starwars_app/layers/data/repositories/get_personagem_repository_imp.dart';
import 'package:starwars_app/layers/domain/usecases/get_filme_usecase/get_filme_usecase_imp.dart';
import 'package:starwars_app/layers/domain/usecases/get_personagem_usecase/get_personagem_usecase_imp.dart';

class FilmeScreen extends StatelessWidget {
  // FilmeController filmeController = FilmeController(GetFilmeUseCaseImp(
  //     GetFilmeRepositoryImp(GetFilmeRemoteDataSourceImp(DioHttpServiceImp()))),
  //    GetPersonagemUseCaseImp(GetPersonagemRepositoryImp(GetPersonagemRemoteDataSourceImp(DioHttpServiceImp()))));
  FilmeController filmeController = GetIt.I.get<FilmeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aaa")

          ),
      body: FutureBuilder(
          future: filmeController.getFilme(),
          builder: (_, snapshot) {
            if(!snapshot.hasData) return Text("empty");
            return Container(
              height: 200,
              child: ListView.builder(
                itemCount: filmeController.filmeEntity.length,
                itemBuilder: (_, index) {
                  return Text(filmeController.filmeEntity[index].titulo);
                },
              ),
            );
          }),
    );
  }
}
