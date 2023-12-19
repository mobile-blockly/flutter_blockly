import 'package:flutter/widgets.dart';

/// BlocklyFontStyle interface
@immutable
class BlocklyFontStyle {
  /// FontStyle constructor
  const BlocklyFontStyle({
    this.family,
    this.weight,
    this.size,
  });

  /// FontStyle.colour property
  final String? family;

  /// FontStyle.colour property
  final String? weight;

  /// FontStyle.colour property
  final num? size;

  /// isNotEmpty method
  bool isNotEmpty() {
    return family != null || weight != null || size != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'family': family,
            'weight': weight,
            'size': size,
          }
        : null;
  }

  /// FontStyle from json
  BlocklyFontStyle.fromJson(Map<String, dynamic>? data)
      : family = data?['family'],
        weight = data?['weight'],
        size = data?['size'];
}
