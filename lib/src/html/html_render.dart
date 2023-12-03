String htmlRender({String style = '', String script = ''}) {
  return '''
<html>
<head>
<meta charset='UTF-8'>
<meta name='viewport' content='minimum-scale=1, initial-scale=1, width=device-width, shrink-to-fit=no'>
$style
</head>
<body>
  <div class='wrapper'>
    <div id='blocklyEditor' class='wrap-container'></div>
  </div>
  $script
  <script src='https://unpkg.com/blockly/blockly.min.js' defer></script>
</body>
</html>
''';
}
