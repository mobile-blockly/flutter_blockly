import 'dart:convert';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

import 'html/html.dart' as html;
import 'types/types.dart';

class BlocklyEditor {
  BlocklyEditor({
    required this.blocklyController,
    this.workspaceConfiguration,
    this.initial,
    this.onError,
    this.onInject,
    this.onChange,
    this.onDispose,
  });

  final WebViewController blocklyController;
  final Map<String, dynamic>? workspaceConfiguration;
  final dynamic initial;
  final Function? onError;
  final Function? onInject;
  final Function? onChange;
  final Function? onDispose;

  BlocklyState _state = BlocklyState();
  ToolboxInfo? _toolboxConfig;
  bool _readOnly = false;

  void init({Map<String, dynamic>? workspaceConfiguration, dynamic initial}) {
    if (_toolboxConfig != null || (!Platform.isAndroid && !Platform.isIOS)) {
      return;
    }

    _readOnly = workspaceConfiguration?['readOnly'] ?? false;
    _postData(event: 'init', data: {
      'workspaceConfiguration': workspaceConfiguration,
      'initial': initial,
    });
  }

  void onLoadEnd(String url) {
    init(workspaceConfiguration: workspaceConfiguration, initial: initial);
  }

  Future<void> _postData({required String event, dynamic data}) async {
    try {
      await blocklyController.runJavaScript(
          "window.message({event: '$event', data: ${jsonEncode(data)}})");
    } catch (err) {
      _onCallBack(cb: onError, arg: err);
    }
  }

  void onMessage(e) {
    try {
      final json = jsonDecode(e.message);

      switch (json['event']) {
        case 'onInject':
          _state = BlocklyState.fromJson(json['data']);
          _onCallBack(cb: onInject, arg: _state);
          break;
        case 'onChange':
          _state = BlocklyState.fromJson(json['data']);
          _onCallBack(cb: onChange, arg: _state);
          break;
        case 'onDispose':
          _onCallBack(cb: onDispose, arg: json['data']);
          break;
        case 'onError':
          _onCallBack(cb: onError, arg: json['data']);
          break;
        case 'toolboxConfig':
          _toolboxConfig = ToolboxInfo.fromJson(json['data']);
          break;
      }
    } catch (err) {
      _onCallBack(cb: onError, arg: err);
    }
  }

  String htmlRender({String? style, String? script}) {
    return html.htmlRender(
      style: html.htmlStyle(style: style),
      script: html.htmlScript(script: script),
    );
  }

  void _onCallBack({Function? cb, dynamic arg}) {
    if (cb != null) {
      cb(arg);
    }
  }

  void updateToolboxConfig(ToolboxInfo Function(ToolboxInfo) cb) {
    try {
      if (_toolboxConfig != null) {
        ToolboxInfo configuration = cb(_toolboxConfig!);
        if (!_readOnly) {
          _postData(event: 'updateToolboxConfig', data: configuration);
        }
      }
    } catch (err) {
      _onCallBack(cb: onError, arg: err);
    }
  }

  void updateState(Map<String, dynamic> Function(BlocklyState) cb) {
    try {
      if (_toolboxConfig != null) {
        Map<String, dynamic> newState = cb(_state);
        _postData(event: 'updateState', data: newState);
      }
    } catch (err) {
      _onCallBack(cb: onError, arg: err);
    }
  }

  BlocklyState state() {
    return _state;
  }
}
