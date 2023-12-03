import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'blockly_editor.dart';

class BlocklyEditorWidget extends StatefulWidget {
  const BlocklyEditorWidget({
    super.key,
    this.workspaceConfiguration,
    this.initial,
    this.onError,
    this.onInject,
    this.onChange,
    this.onDispose,
  });

  final Map<String, dynamic>? workspaceConfiguration;
  final dynamic initial;
  final Function? onError;
  final Function? onInject;
  final Function? onChange;
  final Function? onDispose;

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
    editor = BlocklyEditor(
      blocklyController: blocklyController,
      workspaceConfiguration: widget.workspaceConfiguration,
      initial: widget.initial,
      onError: widget.onError,
      onInject: widget.onInject,
      onChange: widget.onChange,
      onDispose: widget.onDispose,
    );
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
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!(editor.state());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: blocklyController,
    );
  }
}
