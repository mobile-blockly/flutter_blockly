import 'package:flutter/widgets.dart';

@immutable
class Theme {
  const Theme({
    required this.name,
    this.blockStyles,
    this.categoryStyles,
    this.componentStyles,
    this.fontStyle,
    this.startHats,
    this.base,
  });

  final String name;
  final Map<String, BlockStyle>? blockStyles;
  final Map<String, CategoryStyle>? categoryStyles;
  final ComponentStyle? componentStyles;
  final FontStyle? fontStyle;
  final bool? startHats;
  final Theme? base;

  Map<String, dynamic> toJson() => {
        'name': name,
        'blockStyles': blockStyles,
        'categoryStyles': categoryStyles,
        'componentStyles': componentStyles,
        'fontStyle': fontStyle,
        'startHats': startHats,
        'base': base,
      };
}

@immutable
class BlockStyle {
  const BlockStyle({
    required this.colourPrimary,
    required this.colourSecondary,
    required this.colourTertiary,
    required this.hat,
  });

  final String colourPrimary;
  final String colourSecondary;
  final String colourTertiary;
  final String hat;

  Map<String, dynamic> toJson() => {
        'colourPrimary': colourPrimary,
        'colourSecondary': colourSecondary,
        'colourTertiary': colourTertiary,
        'hat': hat,
      };
}

@immutable
class CategoryStyle {
  const CategoryStyle({
    required this.colour,
  });

  final String colour;

  Map<String, dynamic> toJson() => {
        'colour': colour,
      };
}

@immutable
class ComponentStyle {
  const ComponentStyle({
    this.workspaceBackgroundColour,
    this.toolboxBackgroundColour,
    this.toolboxForegroundColour,
    this.flyoutBackgroundColour,
    this.flyoutForegroundColour,
    this.flyoutOpacity,
    this.scrollbarColour,
    this.scrollbarOpacity,
    this.insertionMarkerColour,
    this.insertionMarkerOpacity,
    this.markerColour,
    this.cursorColour,
    this.selectedGlowColour,
    this.selectedGlowOpacity,
    this.replacementGlowColour,
    this.replacementGlowOpacity,
  });

  final String? workspaceBackgroundColour;
  final String? toolboxBackgroundColour;
  final String? toolboxForegroundColour;
  final String? flyoutBackgroundColour;
  final String? flyoutForegroundColour;
  final num? flyoutOpacity;
  final String? scrollbarColour;
  final num? scrollbarOpacity;
  final String? insertionMarkerColour;
  final num? insertionMarkerOpacity;
  final String? markerColour;
  final String? cursorColour;
  final String? selectedGlowColour;
  final num? selectedGlowOpacity;
  final String? replacementGlowColour;
  final num? replacementGlowOpacity;

  Map<String, dynamic> toJson() => {
        'workspaceBackgroundColour': workspaceBackgroundColour,
        'toolboxBackgroundColour': toolboxBackgroundColour,
        'toolboxForegroundColour': toolboxForegroundColour,
        'flyoutBackgroundColour': flyoutBackgroundColour,
        'flyoutForegroundColour': flyoutForegroundColour,
        'flyoutOpacity': flyoutOpacity,
        'scrollbarColour': scrollbarColour,
        'scrollbarOpacity': scrollbarOpacity,
        'insertionMarkerColour': insertionMarkerColour,
        'insertionMarkerOpacity': insertionMarkerOpacity,
        'markerColour': markerColour,
        'cursorColour': cursorColour,
        'selectedGlowColour': selectedGlowColour,
        'selectedGlowOpacity': selectedGlowOpacity,
        'replacementGlowColour': replacementGlowColour,
        'replacementGlowOpacity': replacementGlowOpacity,
      };
}

@immutable
class FontStyle {
  const FontStyle({
    this.family,
    this.weight,
    this.size,
  });

  final String? family;
  final String? weight;
  final num? size;

  Map<String, dynamic> toJson() => {
        'family': family,
        'weight': weight,
        'size': size,
      };
}
