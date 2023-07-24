import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            handleWebResourceError(error);
          },
        ),
      )
      ..loadRequest(Uri.parse('https://eden-star.tchimou.com'));
  }

  void handleWebResourceError(WebResourceError error) {
    // Traitez l'erreur comme vous le souhaitez.
    // Vous pouvez afficher un message d'erreur, enregistrer l'erreur, etc.
    print('Erreur WebView : ${error.errorCode}, ${error.description}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 37, 51),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
