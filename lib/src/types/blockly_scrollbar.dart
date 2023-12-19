import 'package:flutter/widgets.dart';

/// ScrollbarOptions interface
@immutable
class ScrollbarOptions {
  /// ScrollbarOptions constructor
  const ScrollbarOptions({
    this.horizontal,
    this.vertical,
  });

  /// ScrollbarOptions.horizontal property
  final bool? horizontal;

  /// ScrollbarOptions.vertical property
  final bool? vertical;

  /// isNotEmpty method
  bool isNotEmpty() {
    return horizontal != null || vertical != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'horizontal': horizontal,
            'vertical': vertical,
          }
        : null;
  }

  /// ScrollbarOptions from json
  ScrollbarOptions.fromJson(Map<String, dynamic>? data)
      : horizontal = data?['horizontal'],
        vertical = data?['vertical'];
}
