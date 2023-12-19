import 'package:flutter/widgets.dart';

import 'blockly_grid.dart';
import 'blockly_move.dart';
import 'blockly_scrollbar.dart';
import 'blockly_theme.dart';
import 'blockly_toolbox.dart';
import 'blockly_zoom.dart';

/// [BlocklyOptions interface](https://developers.google.com/blockly/reference/js/blockly.blocklyoptions_interface)
@immutable
class BlocklyOptions {
  /// BlocklyOptions constructor
  const BlocklyOptions({
    this.collapse,
    this.comments,
    this.css,
    this.disable,
    this.grid,
    this.horizontalLayout,
    this.maxBlocks,
    this.maxInstances,
    this.media,
    this.modalInputs,
    this.move,
    this.oneBasedIndex,
    this.readOnly,
    this.renderer,
    this.rendererOverrides,
    this.rtl,
    this.scrollbars,
    this.sounds,
    this.theme,
    this.toolbox,
    this.toolboxPosition,
    this.trashcan,
    this.maxTrashcanContents,
    this.plugins,
    this.zoom,
    this.parentWorkspace,
  });

  /// BlocklyOptions.collapse property
  final bool? collapse;

  /// BlocklyOptions.comments property
  final bool? comments;

  /// BlocklyOptions.css property
  final bool? css;

  /// BlocklyOptions.disable property
  final bool? disable;

  /// BlocklyOptions.grid property
  final GridOptions? grid;

  /// BlocklyOptions.horizontalLayout property
  final bool? horizontalLayout;

  /// BlocklyOptions.maxBlocks property
  final num? maxBlocks;

  /// BlocklyOptions.maxInstances property
  final Map<String, num>? maxInstances;

  /// BlocklyOptions.media property
  final String? media;

  /// BlocklyOptions.modalInputs property
  final bool? modalInputs;

  /// BlocklyOptions.move property
  final MoveOptions? move;

  /// BlocklyOptions.oneBasedIndex property
  final bool? oneBasedIndex;

  /// BlocklyOptions.readOnly property
  final bool? readOnly;

  /// BlocklyOptions.renderer property
  final String? renderer;

  /// BlocklyOptions.rendererOverrides property
  final Map<String, dynamic>? rendererOverrides;

  /// BlocklyOptions.rtl property
  final bool? rtl;

  /// BlocklyOptions.scrollbars property
  final ScrollbarOptions? scrollbars;

  /// BlocklyOptions.sounds property
  final bool? sounds;

  /// BlocklyOptions.theme property
  final Theme? theme;

  /// BlocklyOptions.toolbox property
  final ToolboxInfo? toolbox;

  /// BlocklyOptions.toolboxPosition property
  final String? toolboxPosition;

  /// BlocklyOptions.trashcan property
  final bool? trashcan;

  /// BlocklyOptions.maxTrashcanContents property
  final num? maxTrashcanContents;

  /// BlocklyOptions.plugins property
  final Map<String, dynamic>? plugins;

  /// BlocklyOptions.zoom property
  final ZoomOptions? zoom;

  /// BlocklyOptions.parentWorkspace property
  final dynamic parentWorkspace;

  /// isNotEmpty method
  bool isNotEmpty() {
    return collapse != null ||
        comments != null ||
        css != null ||
        disable != null ||
        grid != null ||
        horizontalLayout != null ||
        maxBlocks != null ||
        maxInstances != null ||
        media != null ||
        modalInputs != null ||
        move != null ||
        oneBasedIndex != null ||
        readOnly != null ||
        renderer != null ||
        rendererOverrides != null ||
        rtl != null ||
        scrollbars != null ||
        sounds != null ||
        theme != null ||
        toolbox != null ||
        toolboxPosition != null ||
        trashcan != null ||
        maxTrashcanContents != null ||
        plugins != null ||
        zoom != null ||
        parentWorkspace != null;
  }

  /// isEmpty method
  bool isEmpty() {
    return !isNotEmpty();
  }

  /// jsonEncode
  Map<String, dynamic>? toJson() {
    return isNotEmpty()
        ? {
            'collapse': collapse,
            'comments': comments,
            'css': css,
            'disable': disable,
            'grid': grid,
            'horizontalLayout': horizontalLayout,
            'maxBlocks': maxBlocks,
            'maxInstances': maxInstances,
            'media': media,
            'modalInputs': modalInputs,
            'move': move,
            'oneBasedIndex': oneBasedIndex,
            'readOnly': readOnly,
            'renderer': renderer,
            'rendererOverrides': rendererOverrides,
            'rtl': rtl,
            'scrollbars': scrollbars,
            'sounds': sounds,
            'theme': theme,
            'toolbox': toolbox,
            'toolboxPosition': toolboxPosition,
            'trashcan': trashcan,
            'maxTrashcanContents': maxTrashcanContents,
            'plugins': plugins,
            'zoom': zoom,
            'parentWorkspace': parentWorkspace,
          }
        : null;
  }

  /// BlocklyOptions from json
  BlocklyOptions.fromJson(Map<String, dynamic>? data)
      : collapse = data?['collapse'],
        comments = data?['comments'],
        css = data?['css'],
        disable = data?['disable'],
        grid = GridOptions.fromJson(data?['grid']),
        horizontalLayout = data?['horizontalLayout'],
        maxBlocks = data?['maxBlocks'],
        maxInstances = data?['maxInstances'],
        media = data?['media'],
        modalInputs = data?['modalInputs'],
        move = MoveOptions.fromJson(data?['move']),
        oneBasedIndex = data?['oneBasedIndex'],
        readOnly = data?['readOnly'],
        renderer = data?['renderer'],
        rendererOverrides = data?['rendererOverrides'],
        rtl = data?['rtl'],
        scrollbars = ScrollbarOptions.fromJson(data?['scrollbars']),
        sounds = data?['sounds'],
        theme = Theme.fromJson(data?['theme']),
        toolbox = ToolboxInfo.fromJson(data?['toolbox']),
        toolboxPosition = data?['toolboxPosition'],
        trashcan = data?['trashcan'],
        maxTrashcanContents = data?['maxTrashcanContents'],
        plugins = data?['plugins'],
        zoom = ZoomOptions.fromJson(data?['zoom']),
        parentWorkspace = data?['parentWorkspace'];
}
