/// The html render used for the WebViewWidget
String htmlRender({
  required String editor,
  required String script,
  required String style,
}) {
  return '''
<html>
<head>
<meta charset='UTF-8'>
<meta name='viewport' content='minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no'>
$style
</head>
<body>
  $editor
  $script
  <script src='https://unpkg.com/blockly/blockly.min.js' defer></script>
</body>
</html>
''';
}
