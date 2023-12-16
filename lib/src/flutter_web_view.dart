import 'dart:js_interop';

@JSExport()
class FlutterWebView {
  @JSExport('postMessage')
  void Function(String data) postMessage = (String data) {};
}
