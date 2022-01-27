

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:starwars_app/layers/core/in_app_web_view/app_browser.dart';

class WebViewScreen extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  _WebViewScreenState createState() => _WebViewScreenState();


}

class _WebViewScreenState extends State<WebViewScreen> {
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.browser.openUrlRequest(urlRequest: URLRequest(url:Uri.parse("https://www.starwars.com/community") ),
        options: options);
      },
      child: Text(
        "Site Oficial",
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
