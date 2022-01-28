import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/core/data/services/sqflite_service.dart';

class FavoritosScreen extends StatefulWidget {


  @override
  _FavoritosScreenState createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {


  FilmeController filmeController = GetIt.I.get<FilmeController>();
  List<String> test = [];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future:BancoDadosHelper.instance.recuperarFavoritos(),
          builder: (_, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
                itemCount:test.length,
                itemBuilder: (_, index) {
                  if (test.isEmpty) {
                    return Container();
                  }
                  print(test[index]);
                  print(filmeController.recuperandoPersonagensFavoritos.contains(test[index]));
                  return Card(
                    elevation: 1,
                    color: filmeController.filtrandoLista().contains(test[index]) ?
                    Colors.greenAccent : Colors.redAccent.shade200,
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                         test[index],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        )),
                  );
                });
          })
    );
  }

  @override
  void initState() {
    BancoDadosHelper.instance.recuperarFavoritos().then((value) {
      test = value;
    });
  }
}
