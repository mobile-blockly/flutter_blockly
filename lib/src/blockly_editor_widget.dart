import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'blockly_editor.dart';

class BlocklyEditorWidget extends StatefulWidget {
  const BlocklyEditorWidget({super.key});

  @override
  State<BlocklyEditorWidget> createState() => _BlocklyEditorWidgetState();
}

class _BlocklyEditorWidgetState extends State<BlocklyEditorWidget> {
  late final WebViewController blocklyController;
  late final BlocklyEditor editor;

  @override
  void initState() {
    super.initState();

    blocklyController = WebViewController();
    editor = BlocklyEditor(blocklyController: blocklyController);
    blocklyController
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: editor.onLoadEnd,
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'FlutterWebView',
        onMessageReceived: editor.onMessage,
      )
      ..loadHtmlString(editor.htmlRender());
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: blocklyController,
    );
  }
}
