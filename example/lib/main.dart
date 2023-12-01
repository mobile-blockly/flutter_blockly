import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          sendMessageToWebView();
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterWebView',
        onMessageReceived: (e) {
          final json = jsonDecode(e.message);

          switch (json['event']) {
            case 'onInject':
              break;
            case 'onChange':
              break;
            case 'onDispose':
              break;
            case 'onError':
              // _onCallback(onError, json['data']);
              break;
            case 'toolboxConfig':
              break;
          }
        },
      )
      ..loadFlutterAsset('assets/html/index.html');
  }

  void sendMessageToWebView() async {
    const event = 'state';
    final Map<String, dynamic> data = {'val': "asd"};

    await controller.runJavaScript(
        "window.message({event: '$event', data: ${jsonEncode(data)}})");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
