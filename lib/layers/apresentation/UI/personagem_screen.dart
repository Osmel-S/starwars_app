import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/core/data/services/sqflite_service.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

class PersonagemScreen extends StatefulWidget {
  @override
  _PersonagemScreenState createState() => _PersonagemScreenState();
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  FilmeController filmeController = GetIt.I.get<FilmeController>();
  bool? isFavorite;
  List<int> test2 = List<int>.generate(10, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: filmeController.getPersonagens(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: filmeController.personagemEntity.length,
            itemBuilder: (_, index) {

              return ListTile(
                onTap: () {
                  print("onTap");
                  setState(() {
                    if (filmeController.listFavoritos()[index]) {
                      filmeController.removerPersonagemFavorito(
                          filmeController.personagemEntity[index].nome);
                      filmeController.listFavoritos()[index] = false;
                      test2.removeAt(index);
                    } else {
                      filmeController.adcionarPersonagemFavorito(
                          filmeController.personagemEntity[index].nome, 1);
                      filmeController.listFavoritos()[index] = true;
                      print(index);
                      test2.insert(index, 1);
                    }

                  });
                  print('lista  normal $test2');
                },
                title: Text(
                  filmeController.personagemEntity[index].nome,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Icon(
              filmeController.listFavoritos()[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.redAccent,
                ),
              );
            },
          );
        });
  }
  

  @override
  void initState() {
  }
}
