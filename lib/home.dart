import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class homePage extends StatelessWidget {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(Uri.parse('https://eden-star.tchimou.com'));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
