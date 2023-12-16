/// The html editor
String htmlEditor({String? content, List<String>? classList}) {
  return '''
<div class='wrapper ${classList?.join(' ') ?? ''}'>
  ${content ?? ''}
  <div id='blocklyEditor' class='wrap-container'></div>
</div>
''';
}
