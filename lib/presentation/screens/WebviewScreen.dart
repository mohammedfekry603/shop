import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen({required this.url});
  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..loadRequest(Uri.parse(url)); 

    return Scaffold(
      appBar: AppBar(iconTheme:
       IconThemeData(
        color:Theme.of(context).textTheme.bodyMedium?.color),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
