import 'package:flutter/widgets.dart';

/// Blockly state
@immutable
class BlocklyState {
  /// Create a default Blockly state
  const BlocklyState({
    this.xml = '<xml xmlns="https://developers.google.com/blockly/xml"></xml>',
    this.json = const {},
  });

  /// xml state
  final String? xml;

  /// json state
  final Map<String, dynamic>? json;

  /// jsonEncode
  Map<String, dynamic> toJson() => {
        'xml': xml,
        'json': json,
      };

  /// state from json
  BlocklyState.fromJson(Map<String, dynamic> data)
      : xml = data['xml'],
        json = data['json'];
}
