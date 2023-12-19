import 'package:flutter/widgets.dart';

/// ZoomOptions interface
@immutable
class ZoomOptions {
  /// ZoomOptions constructor
  const ZoomOptions({
    this.controls,
    this.maxScale,
    this.minScale,
    this.pinch,
    this.scaleSpeed,
    this.startScale,
    this.wheel,
  });

  /// ZoomOptions.controls property
  final bool? controls;

  /// ZoomOptions.maxScale property
  final num? maxScale;

  /// ZoomOptions.minScale property
  final num? minScale;

  /// ZoomOptions.pinch property
  final bool? pinch;

  /// ZoomOptions.scaleSpeed property
  final num? scaleSpeed;

  /// ZoomOptions.startScale property
  final num? startScale;

  /// ZoomOptions.wheel property
  final bool? wheel;

  /// isNotEmpty method
  bool isNotEmpty() {
    return controls != null ||
        maxScale != null ||
        minScale != null ||
        pinch != null ||
        scaleSpeed != null ||
        startScale != null ||
        wheel != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'controls': controls,
            'maxScale': maxScale,
            'minScale': minScale,
            'pinch': pinch,
            'scaleSpeed': scaleSpeed,
            'startScale': startScale,
            'wheel': wheel,
          }
        : null;
  }

  /// ZoomOptions from json
  ZoomOptions.fromJson(Map<String, dynamic>? data)
      : controls = data?['controls'],
        maxScale = data?['maxScale'],
        minScale = data?['minScale'],
        pinch = data?['pinch'],
        scaleSpeed = data?['scaleSpeed'],
        startScale = data?['startScale'],
        wheel = data?['wheel'];
}
