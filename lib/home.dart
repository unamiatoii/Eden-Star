import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

Widget homePage() {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 28, 37, 51),
      title: const Text('Safid'),
    ),
    body: const WebView(
      initialUrl: 'https://www.gotche.net/site/backend',
      javascriptMode: JavascriptMode.unrestricted,
    ),
  );
}
