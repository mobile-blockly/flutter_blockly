import 'package:flutter/widgets.dart';

import 'blockly_scrollbar.dart';

/// MoveOptions interface
@immutable
class MoveOptions {
  /// MoveOptions constructor
  const MoveOptions({
    this.drag,
    this.scrollbars,
    this.wheel,
  });

  /// MoveOptions.drag property
  final bool? drag;

  /// MoveOptions.scrollbars property
  final ScrollbarOptions? scrollbars;

  /// MoveOptions.wheel property
  final bool? wheel;

  /// isNotEmpty method
  bool isNotEmpty() {
    return drag != null || scrollbars != null || wheel != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'drag': drag,
            'scrollbars': scrollbars,
            'wheel': wheel,
          }
        : null;
  }

  /// MoveOptions from json
  MoveOptions.fromJson(Map<String, dynamic>? data)
      : drag = data?['drag'],
        scrollbars = ScrollbarOptions.fromJson(data?['scrollbars']),
        wheel = data?['wheel'];
}
