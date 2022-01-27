import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

class PersonagemScreen extends StatefulWidget {
  @override
  _PersonagemScreenState createState() => _PersonagemScreenState();
}

class _PersonagemScreenState extends State<PersonagemScreen> {
  FilmeController filmeController = GetIt.I.get<FilmeController>();
  bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: filmeController.getPersonagens(),
        builder: (_, snapshot) {
          print("incio");
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
                    } else {
                      filmeController.adcionarPersonagemFavorito(
                          filmeController.personagemEntity[index].nome);
                      filmeController.listFavoritos()[index] = true;
                    }
                  });
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
}
