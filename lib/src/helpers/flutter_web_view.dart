import 'dart:js_interop';

/// window.FlutterWebView class
@JSExport()
class FlutterWebView {
  /// window.FlutterWebView.postMessage method
  @JSExport('postMessage')
  void Function(String data) postMessage = (String data) {};
}
