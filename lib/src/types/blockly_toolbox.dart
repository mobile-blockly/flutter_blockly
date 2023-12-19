import 'package:flutter/widgets.dart';

/// create blockly ToolboxInfo
@immutable
class ToolboxInfo {
  /// ToolboxInfo constructor
  const ToolboxInfo({
    required this.contents,
    this.kind,
  });

  /// ToolboxInfo.contents property
  final List contents;

  /// ToolboxInfo.kind property
  final String? kind;

  /// isNotEmpty method
  bool isNotEmpty() {
    return contents.isNotEmpty || kind != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'contents': contents,
            'kind': kind,
          }
        : null;
  }

  /// ToolboxInfo from json
  ToolboxInfo.fromJson(Map<String, dynamic>? data)
      : contents = data?['contents'] ?? [],
        kind = data?['kind'];
}
