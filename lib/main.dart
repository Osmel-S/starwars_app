import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:starwars_app/layers/apresentation/UI/home_screen.dart';
import 'package:starwars_app/layers/core/in_app_web_view/app_browser.dart';
import 'package:starwars_app/layers/core/inject/inject.dart';

import 'layers/apresentation/UI/filme_screen.dart';

void main() {
  Inject.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

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
        home: HomeScreen());
  }
}
