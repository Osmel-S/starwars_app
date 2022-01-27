

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {



  //Listeners

  @override
  Future onBrowserCreated() async {
    print("Browser foi criado!");
  }

  @override
  Future onLoadStart(url) async {
    print("Inicio:  $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Pausado: $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Não foi possível carregar $url.. Erro Aparente: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Carregamento: $progress");
  }

  @override
  void onExit() {
    print("Aplicação fechada!");
  }
}