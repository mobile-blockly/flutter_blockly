import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'html/html.dart' as html;
import 'types/types.dart';

@immutable
class BlocklyEditor {
  const BlocklyEditor({
    required this.blocklyController,
    this.workspaceConfiguration,
    this.initial,
    this.onError,
    this.onInject,
    this.onChange,
    this.onDispose,
    this.platform = 'ios',
  });

  final WebViewController blocklyController;
  final BlocklyOptions? workspaceConfiguration;
  final dynamic initial;
  final Function? onError;
  final Function? onInject;
  final Function? onChange;
  final Function? onDispose;
  final String platform;

  void init(
      {required BlocklyOptions workspaceConfiguration, dynamic initial}) {}

  void onLoadEnd(String url) {
    if (workspaceConfiguration != null) {
      _postData(event: 'init', data: {workspaceConfiguration, initial});
    }
  }

  Future<void> _postData({required String event, dynamic data}) async {
    await blocklyController.runJavaScript(
        "window.message({event: '$event', data: ${jsonEncode(data)}})");
  }

  void onMessage(e) {
    try {
      final json = jsonDecode(e.message);

      switch (json['event']) {
        case 'onInject':
          break;
        case 'onChange':
          break;
        case 'onDispose':
          break;
        case 'onError':
          // _onCallback(onError, json['data']);
          break;
        case 'toolboxConfig':
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
}
