import 'package:flutter/material.dart';
import 'package:starwars_app/layers/apresentation/UI/favoritos_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/filme_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/personagem_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    //  print(filterList);
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text("STAR WARS"),
        leading: Icon(Icons.add),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 30,
            child: Container(),
          ),
          SizedBox(width: 10.0),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Text("Filmes"),
            ),
            Tab(
              child: Text("Personagens"),
            ),
            Tab(
              child: Text("Favoritos"),
            )
          ],
        )
      ),
    body: TabBarView(

    controller: tabController,
    children: [
      FilmeScreen(),
      PersonagemScreen(),
      FavoritosScreen()
    ]
    ));
  }
}
