import 'package:flutter/material.dart';

import 'blockly_editor_web.dart';
import 'types/types.dart';

/// The Flutter Blockly widget visual programming editor
class BlocklyEditorWidget extends StatefulWidget {
  /// ## Example
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: SafeArea(
  ///       child: BlocklyEditorWidget(
  ///         workspaceConfiguration: workspaceConfiguration,
  ///         initial: initial,
  ///         onInject: onInject,
  ///         onChange: onChange,
  ///         onDispose: onDispose,
  ///         onError: onError,
  ///       ),
  ///     ),
  ///   );
  /// }
  /// ```
  const BlocklyEditorWidget({
    super.key,
    this.workspaceConfiguration,
    this.initial,
    this.onError,
    this.onInject,
    this.onChange,
    this.onDispose,
    this.style,
    this.script,
    this.editor,
    this.packages,
  });

  /// [BlocklyOptions interface](https://developers.google.com/blockly/reference/js/blockly.blocklyoptions_interface)
  final BlocklyOptions? workspaceConfiguration;

  /// Blockly initial state (xml string or json)
  final dynamic initial;

  /// It is called on any error
  final Function? onError;

  /// It is called on inject editor
  final Function? onInject;

  /// It is called on change editor sate
  final Function? onChange;

  /// It is called on dispose editor
  final Function? onDispose;

  /// html render style
  final String? style;

  /// html render script
  final String? script;

  /// html render editor
  final String? editor;

  /// html render packages
  final String? packages;

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

    editor
      ..addJavaScriptChannel(
        'FlutterWebView',
        onMessageReceived: editor.onMessage,
      )
      ..htmlRender(
        style: widget.style,
        script: widget.script,
        editor: widget.editor,
        packages: widget.packages,
        onPageFinished: editor.init,
      );
  }

  @override
  void dispose() {
    super.dispose();
    editor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(viewType: 'blocklyEditor');
  }
}
