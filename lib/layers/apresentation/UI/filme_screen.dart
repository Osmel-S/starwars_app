import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';
import 'package:starwars_app/layers/core/data/services/sqflite_service.dart';

class FilmeScreen extends StatefulWidget {
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
                  setState(() {
                    if (filmeController.listFavoritos2()[index]) {
                      filmeController.removerPersonagemFavorito(
                          filmeController.filmeEntity[index].titulo);
                      filmeController.listFavoritos2()[index] = false;
                    } else {
                      filmeController.adcionarPersonagemFavorito(
                          filmeController.filmeEntity[index].titulo, index);
                      filmeController.listFavoritos2()[index] = true;
                    }
                  });
                },
                title: Text(
                  filmeController.filmeEntity[index].titulo,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Icon(
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
