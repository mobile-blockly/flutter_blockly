import 'dart:convert';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'html/html.dart' as html;
import 'types/types.dart';

/// The Flutter Blockly visual programming editor
class BlocklyEditor {
  /// ## Example
  /// ```dart
  /// late final BlocklyEditor editor;
  ///
  /// @override
  /// void initState() {
  ///   super.initState();
  ///   editor = BlocklyEditor(
  ///     workspaceConfiguration: widget.workspaceConfiguration,
  ///     initial: widget.initial,
  ///     onError: widget.onError,
  ///     onInject: widget.onInject,
  ///     onChange: widget.onChange,
  ///     onDispose: widget.onDispose,
  ///   );
  /// }
  /// ```
  BlocklyEditor({
    this.workspaceConfiguration,
    this.initial,
    this.onError,
    this.onInject,
    this.onChange,
    this.onDispose,
  });

  /// [BlocklyOptions interface](https://developers.google.com/blockly/reference/js/blockly.blocklyoptions_interface)
  final Map<String, dynamic>? workspaceConfiguration;

  /// Initial state of Blockly editor (string or json)
  final dynamic initial;

  /// It is called on any error
  final Function? onError;

  /// It is called on inject editor
  final Function? onInject;

  /// It is called on change editor sate
  final Function? onChange;

  /// It is called on dispose editor
  final Function? onDispose;

  /// The WebViewController used for the WebViewWidget
  final WebViewController blocklyController = WebViewController();

  /// Create a default Blockly state
  BlocklyState _state = const BlocklyState();

  /// The Blockly toolbox
  ToolboxInfo? _toolboxConfig;

  bool _readOnly = false;

  /// ## Example
  /// ```dart
  /// editor.blocklyController
  ///   ..setNavigationDelegate(NavigationDelegate(
  ///     onPageFinished: (url) {
  ///       editor.init();
  ///     },
  ///   ));
  /// ```
  void init({Map<String, dynamic>? workspaceConfiguration, dynamic initial}) {
    if (_toolboxConfig != null || (!Platform.isAndroid && !Platform.isIOS)) {
      return;
    }

    _readOnly = workspaceConfiguration?['readOnly'] ??
        this.workspaceConfiguration?['readOnly'] ??
        false;
    _postData(event: 'init', data: {
      'workspaceConfiguration':
          workspaceConfiguration ?? this.workspaceConfiguration,
      'initial': initial ?? this.initial,
    });
  }

  /// ## Example
  /// ```dart
  /// @override
  /// void dispose() {
  ///   super.dispose();
  ///   editor.dispose();
  /// }
  /// ```
  void dispose() {
    if (_toolboxConfig != null) {
      _postData(event: 'dispose');
      _onCallback(cb: onDispose, arg: _state);
      _state = const BlocklyState();
      _toolboxConfig = null;
      _readOnly = false;
    }
  }

  /// It is called on message from the WebViewWidget
  /// ## Example
  /// ```dart
  /// editor.blocklyController
  ///   ..addJavaScriptChannel(
  ///     'FlutterWebView',
  ///     onMessageReceived: editor.onMessage,
  ///   );
  /// ```
  void onMessage(e) {
    try {
      final json = jsonDecode(e.message);
      switch (json['event']) {
        case 'onInject':
          _state = BlocklyState.fromJson(json['data']);
          _onCallback(cb: onInject, arg: _state);
          break;
        case 'onChange':
          _state = BlocklyState.fromJson(json['data']);
          _onCallback(cb: onChange, arg: _state);
          break;
        case 'onError':
          _onCallback(cb: onError, arg: json['data']);
          break;
        case 'toolboxConfig':
          _toolboxConfig = ToolboxInfo.fromJson(json['data']);
          break;
      }
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  /// Update the Blockly editor toolbox
  /// ## Example
  /// ```dart
  /// editor.updateToolboxConfig((prevConfig) {
  ///   return newConfiguration;
  /// });
  /// ```
  void updateToolboxConfig(ToolboxInfo Function(ToolboxInfo) cb) {
    try {
      if (_toolboxConfig != null) {
        ToolboxInfo configuration = cb(_toolboxConfig!);
        if (!_readOnly) {
          _postData(event: 'updateToolboxConfig', data: configuration);
        }
      }
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  /// Update the Blockly editor state
  /// ## Example
  /// ```dart
  /// editor.state((prevState) {
  ///   return newStateJson;
  /// });
  /// ```
  void updateState(Map<String, dynamic> Function(BlocklyState) cb) {
    try {
      if (_toolboxConfig != null) {
        Map<String, dynamic> newState = cb(_state);
        _postData(event: 'updateState', data: newState);
      }
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  /// Get the current state
  BlocklyState state() {
    return _state;
  }

  /// ## Example
  /// ```dart
  /// editor.blocklyController
  ///   ..loadHtmlString(editor.htmlRender());
  /// ```
  String htmlRender({String? style, String? script}) {
    return html.htmlRender(
      style: html.htmlStyle(style: style),
      script: html.htmlScript(script: script),
    );
  }

  /// Post message to the WebViewWidget
  Future<void> _postData({required String event, dynamic data}) async {
    try {
      await blocklyController.runJavaScript(
          "window.message({event: '$event', data: ${jsonEncode(data)}})");
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  void _onCallback({Function? cb, dynamic arg}) {
    try {
      if (cb != null) {
        cb(arg);
      }
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }
}
