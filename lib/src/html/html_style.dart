/// The html style used for the WebViewWidget
String htmlStyle({String? style = ''}) {
  return '''
<style>
html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
  background-color: #fff;
}
.wrapper {
  display: flex;
  flex-direction: column;
  height: 100%;
  min-width: 320px;
  min-height: 320px;
  margin: 0 auto;
}
.wrap-container {
  display: flex;
  flex: 1 0 auto;
  flex-direction: column;
  box-sizing: border-box;
}
$style
</style>
''';
}
