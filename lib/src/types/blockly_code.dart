import 'package:flutter/widgets.dart';

/// BlocklyCode
@immutable
class BlocklyCode {
  /// BlocklyCode constructor
  const BlocklyCode({
    this.dart = '',
    this.js = '',
    this.lua = '',
    this.php = '',
    this.python = '',
  });

  /// dart code
  final String dart;

  /// js code
  final String js;

  /// lua code
  final String lua;

  /// php code
  final String php;

  /// python code
  final String python;

  /// isNotEmpty method
  bool isNotEmpty() {
    return js.isNotEmpty;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'dart': dart,
            'js': js,
            'lua': lua,
            'php': php,
            'python': python,
          }
        : null;
  }

  /// state from json
  BlocklyCode.fromJson(Map<String, dynamic>? data)
      : dart = data?['dart'],
        js = data?['js'],
        lua = data?['lua'],
        php = data?['php'],
        python = data?['python'];
}
