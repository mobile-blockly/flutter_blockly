import 'package:flutter/widgets.dart';

import 'blockly_theme.dart';
import 'blockly_toolbox.dart';

@immutable
class BlocklyOptions {
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

  final bool? collapse;
  final bool? comments;
  final bool? css;
  final bool? disable;
  final GridOptions? grid;
  final bool? horizontalLayout;
  final num? maxBlocks;
  final Map<String, num>? maxInstances;
  final String? media;
  final bool? modalInputs;
  final MoveOptions? move;
  final bool? oneBasedIndex;
  final bool? readOnly;
  final String? renderer;
  final Map<String, dynamic>? rendererOverrides;
  final bool? rtl;
  final ScrollbarOptions? scrollbars;
  final bool? sounds;
  final Theme? theme;
  final ToolboxInfo? toolbox;
  final String? toolboxPosition;
  final bool? trashcan;
  final num? maxTrashcanContents;
  final Map<String, dynamic>? plugins;
  final ZoomOptions? zoom;
  final dynamic parentWorkspace;

  Map<String, dynamic> toJson() => {
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
      };
}

@immutable
class GridOptions {
  const GridOptions({
    this.colour,
    this.length,
    this.snap,
    this.spacing,
  });

  final String? colour;
  final num? length;
  final bool? snap;
  final num? spacing;

  Map<String, dynamic> toJson() => {
        'colour': colour,
        'length': length,
        'snap': snap,
        'spacing': spacing,
      };
}

@immutable
class MoveOptions {
  const MoveOptions({
    this.drag,
    this.scrollbars,
    this.wheel,
  });

  final bool? drag;
  final ScrollbarOptions? scrollbars;
  final bool? wheel;

  Map<String, dynamic> toJson() => {
        'drag': drag,
        'scrollbars': scrollbars,
        'wheel': wheel,
      };
}

@immutable
class ScrollbarOptions {
  const ScrollbarOptions({
    this.horizontal,
    this.vertical,
  });

  final bool? horizontal;
  final bool? vertical;

  Map<String, dynamic> toJson() => {
        'horizontal': horizontal,
        'vertical': vertical,
      };
}

@immutable
class ZoomOptions {
  const ZoomOptions({
    this.controls,
    this.maxScale,
    this.minScale,
    this.pinch,
    this.scaleSpeed,
    this.startScale,
    this.wheel,
  });

  final bool? controls;
  final num? maxScale;
  final num? minScale;
  final bool? pinch;
  final num? scaleSpeed;
  final num? startScale;
  final bool? wheel;

  Map<String, dynamic> toJson() => {
        'controls': controls,
        'maxScale': maxScale,
        'minScale': minScale,
        'pinch': pinch,
        'scaleSpeed': scaleSpeed,
        'startScale': startScale,
        'wheel': wheel,
      };
}

@immutable
class BlocklyState {
  const BlocklyState({
    this.xml = '',
    this.json = const {},
  });

  final String? xml;
  final Map<String, dynamic>? json;

  Map<String, dynamic> toJson() => {
        'xml': xml,
        'json': json,
      };

  BlocklyState.fromJson(Map<String, dynamic> data)
      : xml = data['xml'],
        json = data['json'];
}
