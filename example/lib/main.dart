import 'package:flutter/material.dart';
import 'package:flutter_blockly/flutter_blockly.dart';

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
  };
  final initial = {
    "blocks": {
      "languageVersion": 0,
      "blocks": [
        {
          "type": "text",
          "id": "Y|Ad[E=)p\$+Lu41MXB!o",
          "x": 70,
          "y": 30,
          "fields": {"TEXT": "JSON"}
        }
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocklyEditorWidget(
          workspaceConfiguration: workspaceConfiguration,
          initial: initial,
        ),
      ),
    );
  }
}
