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

class FilmeScreen extends StatefulWidget {
  // FilmeController filmeController = FilmeController(GetFilmeUseCaseImp(
  //     GetFilmeRepositoryImp(GetFilmeRemoteDataSourceImp(DioHttpServiceImp()))),
  //    GetPersonagemUseCaseImp(GetPersonagemRepositoryImp(GetPersonagemRemoteDataSourceImp(DioHttpServiceImp()))));
  @override
  _FilmeScreenState createState() => _FilmeScreenState();
}

class _FilmeScreenState extends State<FilmeScreen> {
  FilmeController filmeController = GetIt.I.get<FilmeController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: filmeController.getFilme(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: filmeController.filmeEntity.length,
            itemBuilder: (_, index) {
              return ListTile(
                onTap: () {
                  print("onTap");
                  setState(() {
                    if (filmeController.listFavoritos2()[index]) {
                      filmeController.removerPersonagemFavorito(
                          filmeController.filmeEntity[index].titulo);
                      filmeController.listFavoritos2()[index] = false;
                    } else {
                      filmeController.adcionarPersonagemFavorito(
                          filmeController.filmeEntity[index].titulo);
                      filmeController.listFavoritos2()[index] = true;
                    }
                  });
                  print(filmeController.listFavoritos2());
                },
                title: Text(
                  filmeController.filmeEntity[index].titulo,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing:
                Icon(
                  filmeController.listFavoritos2()[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.redAccent,
                ),
              );
            },
          );
        });
  }
}
