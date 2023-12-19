import 'package:flutter/widgets.dart';

/// BlocklyBlockStyle interface
@immutable
class BlocklyBlockStyle {
  /// BlocklyBlockStyle constructor
  const BlocklyBlockStyle({
    required this.colourPrimary,
    required this.colourSecondary,
    required this.colourTertiary,
    required this.hat,
  });

  /// BlocklyBlockStyle.colourPrimary property
  final String colourPrimary;

  /// BlocklyBlockStyle.colourSecondary property
  final String colourSecondary;

  /// BlocklyBlockStyle.colourTertiary property
  final String colourTertiary;

  /// BlocklyBlockStyle.hat property
  final String hat;

  /// isNotEmpty method
  bool isNotEmpty() {
    return true;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'colourPrimary': colourPrimary,
            'colourSecondary': colourSecondary,
            'colourTertiary': colourTertiary,
            'hat': hat,
          }
        : null;
  }

  /// BlocklyBlockStyle from json
  BlocklyBlockStyle.fromJson(Map<String, dynamic>? data)
      : colourPrimary = data?['colourPrimary'] ?? '',
        colourSecondary = data?['colourSecondary'] ?? '',
        colourTertiary = data?['colourTertiary'] ?? '',
        hat = data?['hat'] ?? '';
}
