import 'package:flutter/widgets.dart';

import 'blockly_block_style.dart';
import 'blockly_category_style.dart';
import 'blockly_component_style.dart';
import 'blockly_font_style.dart';

/// Theme interface
@immutable
class Theme {
  /// Theme constructor
  const Theme({
    required this.name,
    this.blockStyles,
    this.categoryStyles,
    this.componentStyles,
    this.fontStyle,
    this.startHats,
    this.base,
  });

  /// Theme.name property
  final String name;

  /// Theme.blockStyles property
  final Map<String, BlocklyBlockStyle>? blockStyles;

  /// Theme.categoryStyles property
  final Map<String, BlocklyCategoryStyle>? categoryStyles;

  /// Theme.componentStyles property
  final BlocklyComponentStyle? componentStyles;

  /// Theme.fontStyle property
  final BlocklyFontStyle? fontStyle;

  /// Theme.startHats property
  final bool? startHats;

  /// Theme.base property
  final Theme? base;

  /// isNotEmpty method
  bool isNotEmpty() {
    return blockStyles != null ||
        categoryStyles != null ||
        componentStyles != null ||
        fontStyle != null ||
        startHats != null ||
        base != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'name': name,
            'blockStyles': blockStyles,
            'categoryStyles': categoryStyles,
            'componentStyles': componentStyles,
            'fontStyle': fontStyle,
            'startHats': startHats,
            'base': base,
          }
        : null;
  }

  /// Theme from json
  Theme.fromJson(Map<String, dynamic>? data)
      : name = data?['name'] ?? '',
        blockStyles = data?['blockStyles'],
        categoryStyles = data?['categoryStyles'],
        componentStyles = data?['componentStyles'],
        fontStyle = data?['fontStyle'],
        startHats = data?['startHats'],
        base = data?['base'];
}
