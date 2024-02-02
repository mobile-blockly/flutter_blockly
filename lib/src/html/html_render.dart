/// The html render used for the WebViewWidget
String htmlRender({
  String? editor,
  String? script,
  String? style,
  String? packages,
}) {
  return '''
<html>
<head>
<meta charset='UTF-8'>
<meta name='viewport' content='minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no'>
${style ?? ''}
</head>
<body>
  ${editor ?? ''}
  ${packages ?? ''}
  ${script ?? ''}
</body>
</html>
''';
}
