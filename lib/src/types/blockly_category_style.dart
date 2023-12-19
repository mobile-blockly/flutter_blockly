import 'package:flutter/widgets.dart';

/// BlocklyCategoryStyle interface
@immutable
class BlocklyCategoryStyle {
  /// BlocklyCategoryStyle constructor
  const BlocklyCategoryStyle({
    required this.colour,
  });

  /// BlocklyCategoryStyle property
  final String colour;

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
            'colour': colour,
          }
        : null;
  }

  /// BlocklyCategoryStyle from json
  BlocklyCategoryStyle.fromJson(Map<String, dynamic>? data)
      : colour = data?['colour'] ?? '';
}
