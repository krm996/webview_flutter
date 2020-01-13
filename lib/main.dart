import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(WebViewBrowser());

class WebViewBrowser extends StatefulWidget {
  @override
  _WebViewBrowserState createState() => _WebViewBrowserState();
}

class _WebViewBrowserState extends State<WebViewBrowser> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Browser'),
        ),
        body: WebView(
          initialUrl: 'https://www.google.com',
          gestureRecognizers: Set()
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controler) {
            _controller.complete(controler);
          },
        ),
      ),
    );
  }
}
