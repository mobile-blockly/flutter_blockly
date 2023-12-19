import 'package:flutter/widgets.dart';

/// BlocklyJsonState
@immutable
class BlocklyJsonState {
  /// BlocklyJsonState constructor
  const BlocklyJsonState({
    this.json = const {},
  });

  /// json state
  final Map<String, dynamic>? json;

  /// isNotEmpty method
  bool isNotEmpty() {
    return json != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty() ? json : null;
  }

  /// state from json
  BlocklyJsonState.fromJson(Map<String, dynamic>? data) : json = data?['json'];
}
