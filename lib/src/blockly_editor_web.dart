import 'dart:convert';
import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/services.dart';
import 'package:js/js_util.dart';

import 'helpers/create_web_tag.dart';
import 'helpers/flutter_web_view.dart';
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
  final BlocklyOptions? workspaceConfiguration;

  /// Initial state of Blockly editor (xml string or json)
  final dynamic initial;

  /// It is called on any error
  /// ## Example
  /// ```dart
  /// void onError(dynamic error) {}
  /// ```
  final Function? onError;

  /// It is called on inject editor
  /// ## Example
  /// ```dart
  /// void onInject(BlocklyData data) {}
  /// ```
  final Function? onInject;

  /// It is called on change editor sate
  /// ## Example
  /// ```dart
  /// void onChange(BlocklyData data) {}
  /// ```
  final Function? onChange;

  /// It is called on dispose editor
  /// ## Example
  /// ```dart
  /// void onDispose(BlocklyData data) {}
  /// ```
  final Function? onDispose;

  /// Create a default Blockly state
  BlocklyState _state = const BlocklyState();

  /// The Blockly toolbox
  ToolboxInfo? _toolboxConfig;

  bool _readOnly = false;

  final Element _divElement = DivElement()
    ..style.width = '100%'
    ..style.height = '100%';

  /// code
  BlocklyCode _code = const BlocklyCode();

  /// ## Example
  /// ```dart
  /// editor.init();
  /// ```
  void init({BlocklyOptions? workspaceConfiguration, dynamic initial}) {
    final Element? editor = document.querySelector('#blocklyEditor');
    if (_toolboxConfig != null || editor == null) {
      return;
    }

    _readOnly = workspaceConfiguration?.readOnly ??
        this.workspaceConfiguration?.readOnly ??
        false;
    postData(
      event: 'init',
      data: {
        'workspaceConfiguration':
            workspaceConfiguration ?? this.workspaceConfiguration,
        'initial': initial ?? this.initial,
      },
    );
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
      postData(event: 'dispose');
      _onCallback(cb: onDispose, arg: _getData());
      _state = const BlocklyState();
      _toolboxConfig = null;
      _readOnly = false;
    }
  }

  /// Adds a new javascript chanel
  /// ## Example
  /// ```dart
  /// editor
  ///   ..addJavaScriptChannel(
  ///     'FlutterWebView',
  ///     onMessageReceived: editor.onMessage,
  ///   );
  /// ```
  void addJavaScriptChannel(
    String name, {
    required void Function(String message) onMessageReceived,
  }) {
    final webView = FlutterWebView();
    webView.postMessage = onMessageReceived;
    final export = createDartExport(webView);
    setProperty(window, name, export);
  }

  /// It is called on message from the WebViewWidget
  /// ## Example
  /// ```dart
  /// editor
  ///   ..addJavaScriptChannel(
  ///     'FlutterWebView',
  ///     onMessageReceived: editor.onMessage,
  ///   );
  /// ```
  void onMessage(String message) {
    try {
      final json = jsonDecode(message);
      switch (json['event']) {
        case 'onInject':
          _state = BlocklyState.fromJson(json['data']);
          _onCallback(cb: onInject, arg: _getData());
          break;
        case 'onChange':
          _state = BlocklyState.fromJson(json['data']);
          _code = BlocklyCode.fromJson(json['data']);
          _onCallback(cb: onChange, arg: _getData());
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
          postData(event: 'updateToolboxConfig', data: configuration);
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
  void updateState(BlocklyJsonState Function(BlocklyState) cb) {
    try {
      if (_toolboxConfig != null) {
        BlocklyJsonState newState = cb(_state);
        postData(event: 'updateState', data: newState);
      }
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  /// Get the current state
  /// ## Example
  /// ```dart
  /// editor.state();
  /// ```
  BlocklyState state() {
    return _state;
  }

  /// Get the current code
  /// ## Example
  /// ```dart
  /// editor.code();
  /// ```
  BlocklyCode code() {
    return _code;
  }

  /// ## Example
  /// ```dart
  /// editor.htmlRender(onPageFinished: editor.init);
  /// ```
  void htmlRender({
    String? style,
    String? script,
    String? editor,
    String? packages,
    Function? onPageFinished,
  }) async {
    final Element? blocklyScript = document.querySelector('#blocklyScript');
    _divElement.innerHtml = "";
    _divElement.insertAdjacentElement(
      'beforeend',
      createWebTag(
        tag: 'style',
        content: html.htmlStyle(style: style),
      ),
    );
    _divElement.insertAdjacentHtml(
      'beforeend',
      editor ?? html.htmlEditor(),
    );

    final scripts = [
      'dart_compressed',
      'javascript_compressed',
      'lua_compressed',
      'php_compressed',
      'python_compressed',
      'en',
      'html_script',
    ];

    if (blocklyScript == null) {
      platformViewRegistry.registerViewFactory(
        'blocklyEditor',
        (int viewId) {
          return _divElement;
        },
      );

      final blockly = createWebTag(
        tag: 'script',
        content: await rootBundle.loadString(
          'packages/flutter_blockly/assets/blockly_compressed.js',
        ),
      );
      blockly.id = "blocklyScript";
      document.body?.insertAdjacentElement('beforeend', blockly);

      for (var name in scripts) {
        document.body?.insertAdjacentElement(
          'beforeend',
          createWebTag(
            tag: 'script',
            content: await rootBundle.loadString(
              'packages/flutter_blockly/assets/$name.js',
            ),
          ),
        );
      }

      if (script != null) {
        document.body?.insertAdjacentElement(
          'beforeend',
          createWebTag(
            tag: 'script',
            content: script,
          ),
        );
      }

      if (packages != null) {
        document.body?.insertAdjacentHtml(
          'beforeend',
          packages,
        );
      }
    }

    if (onPageFinished != null) {
      onPageFinished();
    }
  }

  /// Post message to the Web
  /// ## Example
  /// ```dart
  /// editor.postData(event: 'eval', data: 'alert(editor.state().xml)');
  /// ```
  Future<void> postData({required String event, dynamic data}) async {
    try {
      callMethod<void>(
        window,
        'message',
        [
          jsonEncode({'event': event, 'data': data}),
        ],
      );
    } catch (err) {
      _onCallback(cb: onError, arg: err);
    }
  }

  /// run javascript in WebView
  /// ## Example
  /// ```dart
  /// editor.runJS('alert(editor.state().xml)');
  /// ```
  void runJS(String code) {
    postData(event: 'eval', data: code);
  }

  /// get state and code
  _getData() {
    final data = _state.toJson();
    data?.addAll(_code.toJson() ?? {});
    return BlocklyData.fromJson(data);
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
