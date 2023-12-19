import 'package:flutter/widgets.dart';

/// Blockly state
@immutable
class BlocklyState {
  /// Blockly state constructor
  const BlocklyState({
    this.xml = '<xml xmlns="https://developers.google.com/blockly/xml"></xml>',
    this.json = const {},
  });

  /// xml state
  final String? xml;

  /// json state
  final Map<String, dynamic>? json;

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
          }
        : null;
  }

  /// state from json
  BlocklyState.fromJson(Map<String, dynamic>? data)
      : xml = data?['xml'],
        json = data?['json'];
}
