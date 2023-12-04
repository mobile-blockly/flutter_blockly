import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'blockly_editor.dart';

/// A Flutter Blockly widget - visual programming editor
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

  /// [BlocklyOptions interface](https://developers.google.com/blockly/reference/js/blockly.blocklyoptions_interface)
  final Map<String, dynamic>? workspaceConfiguration;

  /// Blockly initial state (string or json)
  final dynamic initial;

  /// It is called on any error
  final Function? onError;

  /// It is called on inject editor
  final Function? onInject;

  /// It is called on change editor sate
  final Function? onChange;

  /// It is called on dispose editor
  final Function? onDispose;

  @override
  State<BlocklyEditorWidget> createState() => _BlocklyEditorWidgetState();
}

class _BlocklyEditorWidgetState extends State<BlocklyEditorWidget> {
  late final BlocklyEditor editor;

  @override
  void initState() {
    super.initState();

    /// Create new BlocklyEditor
    editor = BlocklyEditor(
      workspaceConfiguration: widget.workspaceConfiguration,
      initial: widget.initial,
      onError: widget.onError,
      onInject: widget.onInject,
      onChange: widget.onChange,
      onDispose: widget.onDispose,
    );

    /// Configuration the WebViewController
    editor.blocklyController
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          editor.init();
        },
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
    editor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: editor.blocklyController,
    );
  }
}
