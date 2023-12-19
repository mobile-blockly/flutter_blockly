import 'package:flutter/widgets.dart';

/// GridOptions interface
@immutable
class GridOptions {
  /// GridOptions constructor
  const GridOptions({
    this.colour,
    this.length,
    this.snap,
    this.spacing,
  });

  /// GridOptions.colour property
  final String? colour;

  /// GridOptions.length property
  final num? length;

  /// GridOptions.snap property
  final bool? snap;

  /// GridOptions.spacing property
  final num? spacing;

  /// isNotEmpty method
  bool isNotEmpty() {
    return colour != null || length != null || snap != null || spacing != null;
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
            'length': length,
            'snap': snap,
            'spacing': spacing,
          }
        : null;
  }

  /// GridOptions from json
  GridOptions.fromJson(Map<String, dynamic>? data)
      : colour = data?['colour'],
        length = data?['length'],
        snap = data?['snap'],
        spacing = data?['spacing'];
}
