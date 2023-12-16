# flutter_blockly

[![Built on Blockly](https://tinyurl.com/built-on-blockly)](https://github.com/google/blockly)
<br/>
[![pub version](https://img.shields.io/pub/v/flutter_blockly.svg)](https://pub.dev/packages/flutter_blockly)

<details><summary>Click to see the screenshot</summary>

![Flutter Blockly editor](https://github-production-user-asset-6210df.s3.amazonaws.com/26460350/283968394-fdf46ed0-276b-4171-86fb-94f5d69940e4.png)

</details>

## [Change Log](https://github.com/SerSerch/flutter_blockly/blob/main/CHANGELOG.md).

## Usage

[BlocklyOptions interface](https://developers.google.com/blockly/reference/js/blockly.blocklyoptions_interface)

<details><summary>Click to see the code</summary>

```dart
import 'package:flutter_blockly/flutter_blockly.dart';

// ...

@override
Widget build(BuildContext context) {
return Scaffold(
  body: SafeArea(
    child: BlocklyEditorWidget(
      workspaceConfiguration: workspaceConfiguration,
      initial: initial,
      onInject: onInject,
      onChange: onChange,
      onDispose: onDispose,
      onError: onError,
    ),
  ),
);
}
```
  
</details>

or if you want to use additional methods, see how it's implemented here
<br><br>
IOS and Android [BlocklyEditorWidget](https://github.com/SerSerch/flutter_blockly/blob/main/lib/src/blockly_editor_widget.dart)

<details><summary>Click to see the code</summary>

```dart
import 'package:flutter_blockly/flutter_blockly.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ...

class _MyWidgetState extends State<MyWidgetState> {
  late final BlocklyEditor editor;

  @override
  void initState() {
    super.initState();

    editor = BlocklyEditor(
      workspaceConfiguration: widget.workspaceConfiguration,
      initial: widget.initial,
      onError: widget.onError,
      onInject: widget.onInject,
      onChange: widget.onChange,
      onDispose: widget.onDispose,
    );
    
    // then you will have methods and WebViewController:
    // editor.init();
    // editor.dispose();
    // editor.onMessage();
    // editor.htmlRender();
    // editor.updateToolboxConfig();
    // editor.updateState();
    // editor.state();
    // editor.blocklyController;
  }
}
```

</details>

Web [BlocklyEditorWidget](https://github.com/SerSerch/flutter_blockly/blob/main/lib/src/blockly_editor_web_widget.dart)

<details><summary>Click to see the code</summary>

```dart
import 'package:flutter_blockly/flutter_blockly.dart';

// ...

class _MyWidgetState extends State<MyWidgetState> {
  late final BlocklyEditor editor;

  @override
  void initState() {
    super.initState();

    editor = BlocklyEditor(
      workspaceConfiguration: widget.workspaceConfiguration,
      initial: widget.initial,
      onError: widget.onError,
      onInject: widget.onInject,
      onChange: widget.onChange,
      onDispose: widget.onDispose,
    );
    
    // then you will have methods:
    // editor.init();
    // editor.dispose();
    // editor.htmlRender();
    // editor.updateToolboxConfig();
    // editor.updateState();
    // editor.state();
  }
}
```

</details>

## Example

[flutter_blockly_example](https://github.com/SerSerch/flutter_blockly/blob/main/example)

## License

[MIT](LICENSE)
