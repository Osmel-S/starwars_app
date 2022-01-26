import 'package:flutter/material.dart';
import 'package:starwars_app/layers/apresentation/UI/home_screen.dart';
import 'package:starwars_app/layers/core/inject/inject.dart';

import 'layers/apresentation/UI/filme_screen.dart';

void main() {
  Inject.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
