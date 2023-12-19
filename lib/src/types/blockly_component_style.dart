import 'package:flutter/widgets.dart';

/// BlocklyComponentStyle interface
@immutable
class BlocklyComponentStyle {
  /// BlocklyComponentStyle constructor
  const BlocklyComponentStyle({
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

  /// BlocklyComponentStyle.workspaceBackgroundColour property
  final String? workspaceBackgroundColour;

  /// BlocklyComponentStyle.toolboxBackgroundColour property
  final String? toolboxBackgroundColour;

  /// BlocklyComponentStyle.toolboxForegroundColour property
  final String? toolboxForegroundColour;

  /// BlocklyComponentStyle.flyoutBackgroundColour property
  final String? flyoutBackgroundColour;

  /// BlocklyComponentStyle.flyoutForegroundColour property
  final String? flyoutForegroundColour;

  /// BlocklyComponentStyle.flyoutOpacity property
  final num? flyoutOpacity;

  /// BlocklyComponentStyle.scrollbarColour property
  final String? scrollbarColour;

  /// BlocklyComponentStyle.scrollbarOpacity property
  final num? scrollbarOpacity;

  /// BlocklyComponentStyle.insertionMarkerColour property
  final String? insertionMarkerColour;

  /// BlocklyComponentStyle.insertionMarkerOpacity property
  final num? insertionMarkerOpacity;

  /// BlocklyComponentStyle.markerColour property
  final String? markerColour;

  /// BlocklyComponentStyle.cursorColour property
  final String? cursorColour;

  /// BlocklyComponentStyle.selectedGlowColour property
  final String? selectedGlowColour;

  /// BlocklyComponentStyle.selectedGlowOpacity property
  final num? selectedGlowOpacity;

  /// BlocklyComponentStyle.replacementGlowColour property
  final String? replacementGlowColour;

  /// BlocklyComponentStyle.replacementGlowOpacity property
  final num? replacementGlowOpacity;

  /// isNotEmpty method
  bool isNotEmpty() {
    return workspaceBackgroundColour != null ||
        toolboxBackgroundColour != null ||
        toolboxForegroundColour != null ||
        flyoutBackgroundColour != null ||
        flyoutForegroundColour != null ||
        flyoutOpacity != null ||
        scrollbarColour != null ||
        scrollbarOpacity != null ||
        insertionMarkerColour != null ||
        insertionMarkerOpacity != null ||
        markerColour != null ||
        cursorColour != null ||
        selectedGlowColour != null ||
        selectedGlowOpacity != null ||
        replacementGlowColour != null ||
        replacementGlowOpacity != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
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
          }
        : null;
  }

  /// BlocklyComponentStyle from json
  BlocklyComponentStyle.fromJson(Map<String, dynamic>? data)
      : workspaceBackgroundColour = data?['workspaceBackgroundColour'],
        toolboxBackgroundColour = data?['toolboxBackgroundColour'],
        toolboxForegroundColour = data?['toolboxForegroundColour'],
        flyoutBackgroundColour = data?['flyoutBackgroundColour'],
        flyoutForegroundColour = data?['flyoutForegroundColour'],
        flyoutOpacity = data?['flyoutOpacity'],
        scrollbarColour = data?['scrollbarColour'],
        scrollbarOpacity = data?['scrollbarOpacity'],
        insertionMarkerColour = data?['insertionMarkerColour'],
        insertionMarkerOpacity = data?['insertionMarkerOpacity'],
        markerColour = data?['markerColour'],
        cursorColour = data?['cursorColour'],
        selectedGlowColour = data?['selectedGlowColour'],
        selectedGlowOpacity = data?['selectedGlowOpacity'],
        replacementGlowColour = data?['replacementGlowColour'],
        replacementGlowOpacity = data?['replacementGlowOpacity'];
}
