import 'package:flutter/widgets.dart';

/// BlocklyData
@immutable
class BlocklyData {
  /// BlocklyData constructor
  const BlocklyData({
    this.xml = '<xml xmlns="https://developers.google.com/blockly/xml"></xml>',
    this.json = const {},
    this.dart = '',
    this.js = '',
    this.lua = '',
    this.php = '',
    this.python = '',
  });

  /// xml state
  final String? xml;

  /// json state
  final Map<String, dynamic>? json;

  /// dart code
  final String? dart;

  /// js code
  final String? js;

  /// lua code
  final String? lua;

  /// php code
  final String? php;

  /// python code
  final String? python;

  /// isNotEmpty method
  bool isNotEmpty() {
    return xml != null || json != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'xml': xml,
            'json': json,
            'dart': dart,
            'js': js,
            'lua': lua,
            'php': php,
            'python': python,
          }
        : null;
  }

  /// state from json
  BlocklyData.fromJson(Map<String, dynamic>? data)
      : xml = data?['xml'],
        json = data?['json'],
        dart = data?['dart'],
        js = data?['js'],
        lua = data?['lua'],
        php = data?['php'],
        python = data?['python'];
}
