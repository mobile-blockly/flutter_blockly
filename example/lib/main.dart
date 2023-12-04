import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blockly/flutter_blockly.dart';

import 'content.dart';

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
  final workspaceConfiguration = {
    'grid': {
      'spacing': 20,
      'length': 3,
      'colour': '#ccc',
      'snap': true,
    },
    'toolbox': initialToolboxJson,
  };

  void onInject(state) {
    debugPrint('onInject: ${state.xml}\n${jsonEncode(state.json)}');
  }

  void onChange(state) {
    debugPrint('onChange: ${state.xml}\n${jsonEncode(state.json)}');
  }

  void onDispose(state) {
    debugPrint('onDispose: ${state.xml}\n${jsonEncode(state.json)}');
  }

  void onError(dynamic err) {
    debugPrint('onError: $err');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocklyEditorWidget(
          workspaceConfiguration: workspaceConfiguration,
          initial: initialJson,
          onInject: onInject,
          onChange: onChange,
          onDispose: onDispose,
          onError: onError,
        ),
      ),
    );
  }
}
