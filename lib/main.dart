import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safid',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 28, 37, 51),
          title: const Text('Safid'),
        ),
        body: const WebView(
          initialUrl: 'https://www.gotche.net/site/backend',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
d