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
  // final BlocklyOptions workspaceConfiguration = BlocklyOptions(
  //   grid: const GridOptions(
  //     spacing: 20,
  //     length: 3,
  //     colour: '#ccc',
  //     snap: true,
  //   ),
  //   toolbox: ToolboxInfo.fromJson(initialToolboxJson),
  // );

  final BlocklyOptions workspaceConfiguration = BlocklyOptions.fromJson(const {
    'grid': {
      'spacing': 20,
      'length': 3,
      'colour': '#ccc',
      'snap': true,
    },
    'toolbox': initialToolboxJson,
    // null safety example
    'collapse': null,
    'comments': null,
    'css': null,
    'disable': null,
    'horizontalLayout': null,
    'maxBlocks': null,
    'maxInstances': null,
    'media': null,
    'modalInputs': null,
    'move': null,
    'oneBasedIndex': null,
    'readOnly': null,
    'renderer': null,
    'rendererOverrides': null,
    'rtl': null,
    'scrollbars': null,
    'sounds': null,
    'theme': null,
    'toolboxPosition': null,
    'trashcan': null,
    'maxTrashcanContents': null,
    'plugins': null,
    'zoom': null,
    'parentWorkspace': null,
  });

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
