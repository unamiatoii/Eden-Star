import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

Widget homePage() {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 28, 37, 51),
    ),
    body: FutureBuilder<bool?>(
      future: _checkInternetConnection(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle the loading state if needed.
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          // Handle the error state if there is an issue with connectivity or data.
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.white, size: 80),
                SizedBox(height: 20),
                Text(
                  'Vérifiez votre connexion internet',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          if (snapshot.data!) {
            return WebView(
              initialUrl: 'https://eden-star.tchimou.com',
              javascriptMode: JavascriptMode.unrestricted,
              onWebResourceError: (WebResourceError error) {
                // Handle the case when there is an error with the WebView during usage.
                // You can show a custom error message or take other actions here.
              },
            );
          } else {
            // Handle the case when the internet connection is not available.
            // You can choose to show a different widget or display an error message.
            return Center(
              child: Text(
                'Internet connection is not available.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
        }
      },
    ),
  );
}

Future<bool?> _checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi);
}
