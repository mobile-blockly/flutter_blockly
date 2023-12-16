import 'package:flutter/widgets.dart';

/// create blockly ToolboxInfo
@immutable
class ToolboxInfo {
  /// ```dart
  /// ToolboxInfo.fromJson(json['data'])
  /// ```
  const ToolboxInfo({
    required this.contents,
    this.kind,
  });

  final List contents;
  final String? kind;

  ToolboxInfo.fromJson(Map<String, dynamic> data)
      : contents = data['contents'],
        kind = data['kind'];

  Map<String, dynamic> toJson() => {
        'contents': contents,
        'kind': kind,
      };
}
