import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';

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
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: filmeController.personagemEntity.length,
            itemBuilder: (_, index) {
              print("inicio ${filmeController.recuperandoPersonagensFavoritos}");
              return ListTile(

                onTap: () {

                  setState(() {

                    if(filmeController.listFavoritos()[index]){
                      filmeController.removendoPersonagemFavorito(filmeController.personagemEntity[index]);
                      filmeController.listFavoritos()[index] = false;
                    }else{
                      filmeController.adicionandoPersonagemFavorito(filmeController.personagemEntity[index]);
                      filmeController.listFavoritos()[index] = true;
                    }

                    print("onmtap ${filmeController.recuperandoPersonagensFavoritos}");
                    print("onmtap ${filmeController.listFavoritos()}");

                  });

                },
                title: Text(
                  filmeController.personagemEntity[index].nome,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing:  filmeController.listFavoritos().isEmpty
                    ? Icon(Icons.favorite_border,color: Colors.purple,)
                    : Icon(
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
