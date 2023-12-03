import 'package:flutter/widgets.dart';

@immutable
class ToolboxInfo {
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

@immutable
class BlockInfo {
  const BlockInfo({
    required this.kind,
    this.blockxml,
    this.type,
    this.gap,
    this.disabled,
    this.enabled,
    this.id,
    this.x,
    this.y,
    this.collapsed,
    this.inline,
    this.data,
    this.extraState,
    this.icons,
    this.fields,
    this.inputs,
    this.next,
  });

  final String kind;
  final String? blockxml;
  final String? type;
  final num? gap;
  final bool? disabled;
  final bool? enabled;
  final String? id;
  final num? x;
  final num? y;
  final bool? collapsed;
  final bool? inline;
  final String? data;
  final dynamic extraState;
  final Map<String, dynamic>? icons;
  final Map<String, dynamic>? fields;
  final Map<String, ConnectionState>? inputs;
  final ConnectionState? next;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'blockxml': blockxml,
        'type': type,
        'gap': gap,
        'disabled': disabled,
        'enabled': enabled,
        'id': id,
        'x': x,
        'y': y,
        'collapsed': collapsed,
        'inline': inline,
        'data': data,
        'extraState': extraState,
        'icons': icons,
        'fields': fields,
        'inputs': inputs,
        'next': next,
      };
}

@immutable
class SeparatorInfo {
  const SeparatorInfo({
    required this.kind,
    this.id,
    this.gap,
    this.cssconfig,
  });

  final String kind;
  final String? id;
  final num? gap;
  final SeparatorCssConfig? cssconfig;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'gap': gap,
        'cssconfig': cssconfig,
      };
}

@immutable
class ButtonInfo {
  const ButtonInfo({
    required this.kind,
    required this.text,
    required this.callbackkey,
  });

  final String kind;
  final String text;
  final String callbackkey;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'text': text,
        'callbackkey': callbackkey,
      };
}

@immutable
class LabelInfo {
  const LabelInfo({
    required this.kind,
    required this.text,
    this.id,
  });

  final String kind;
  final String text;
  final String? id;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'text': text,
        'id': id,
      };
}

@immutable
class StaticCategoryInfo {
  const StaticCategoryInfo({
    required this.kind,
    required this.name,
    required this.contents,
    this.id,
    this.categorystyle,
    this.colour,
    this.cssconfig,
    this.hidden,
    this.expanded,
  });

  final String kind;
  final String name;
  final List contents;
  final String? id;
  final String? categorystyle;
  final String? colour;
  final CategoryCssConfig? cssconfig;
  final String? hidden;
  final bool? expanded;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'name': name,
        'contents': contents,
        'id': id,
        'categorystyle': categorystyle,
        'colour': colour,
        'cssconfig': cssconfig,
        'hidden': hidden,
        'expanded': expanded,
      };
}

@immutable
class DynamicCategoryInfo {
  const DynamicCategoryInfo({
    required this.kind,
    required this.custom,
    this.id,
    this.categorystyle,
    this.colour,
    this.cssconfig,
    this.hidden,
    this.expanded,
  });

  final String kind;
  final String custom;
  final String? id;
  final String? categorystyle;
  final String? colour;
  final CategoryCssConfig? cssconfig;
  final String? hidden;
  final bool? expanded;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'custom': custom,
        'id': id,
        'categorystyle': categorystyle,
        'colour': colour,
        'cssconfig': cssconfig,
        'hidden': hidden,
        'expanded': expanded,
      };
}

@immutable
class SeparatorCssConfig {
  const SeparatorCssConfig({
    this.container,
  });

  final String? container;

  Map<String, dynamic> toJson() => {
        'container': container,
      };
}

@immutable
class CategoryCssConfig {
  const CategoryCssConfig({
    this.container,
    this.row,
    this.rowcontentcontainer,
    this.icon,
    this.label,
    this.contents,
    this.selected,
    this.openicon,
    this.closedicon,
  });

  final String? container;
  final String? row;
  final String? rowcontentcontainer;
  final String? icon;
  final String? label;
  final String? contents;
  final String? selected;
  final String? openicon;
  final String? closedicon;

  Map<String, dynamic> toJson() => {
        'container': container,
        'row': row,
        'rowcontentcontainer': rowcontentcontainer,
        'icon': icon,
        'label': label,
        'contents': contents,
        'selected': selected,
        'openicon': openicon,
        'closedicon': closedicon,
      };
}
