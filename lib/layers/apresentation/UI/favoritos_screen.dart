import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';

class FavoritosScreen extends StatefulWidget {
  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  FilmeController filmeController = GetIt.I.get<FilmeController>();
  List<String> test = ["R5-D4","Luke Skywalker","Darth Vader"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: filmeController.recuperandoPersonagensFavoritos.length,
          itemBuilder: (_, index) {
            if (filmeController.recuperandoPersonagensFavoritos.isEmpty) {
              return Container();
            }
            print(filmeController.recuperandoPersonagensFavoritos[index]);
            print(filmeController.recuperandoPersonagensFavoritos.contains(test[1]));
            return Card(
              elevation: 1,
              color: filmeController.filtrandoLista().contains(filmeController.recuperandoPersonagensFavoritos[index]) ?
              Colors.greenAccent : Colors.redAccent.shade200,
              child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    filmeController.recuperandoPersonagensFavoritos[index],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  )),
            );
          }),
    );
  }
}
