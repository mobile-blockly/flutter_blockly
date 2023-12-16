import 'dart:html';

/// cuts the tag from the string
/// and creates a new html tag
/// '<style>body{background: #fff}</style>'
Element createWebTag({required String tag, String? content}) {
  final Element element = document.createElement(tag);
  final String text = content?.replaceAll(RegExp('<$tag>|</$tag>'), '') ?? '';
  element.insertAdjacentText('afterbegin', text);

  return element;
}
