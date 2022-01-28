import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_app/layers/apresentation/UI/avatar_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/favoritos_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/filme_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/personagem_screen.dart';
import 'package:starwars_app/layers/apresentation/UI/web_view_screen.dart';
import 'package:starwars_app/layers/apresentation/filme_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  FilmeController filmeController = GetIt.I.get<FilmeController>();

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WebViewScreen(),
                Text("STAR WARS"),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            // centerTitle: true,
            actions: [
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AvatarScreen())),
                child: CircleAvatar(
                  radius: 30,
                  child: FluttermojiCircleAvatar(
                    backgroundColor: Colors.grey[200],
                    radius: 100,
                  ),
                ),
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
            )),
        body: TabBarView(
            controller: tabController,
            children: [FilmeScreen(), PersonagemScreen(), FavoritosScreen()]));
  }
}
