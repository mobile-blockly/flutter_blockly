import 'package:web/web.dart' as web;

/// cuts the tag from the string
/// and creates a new html tag
/// '<style>body{background: #fff}</style>'
web.Element createWebTag({required String tag, String? content}) {
  final web.Element element = web.document.createElement(tag);
  final String text = content?.replaceAll(RegExp('<$tag>|</$tag>'), '') ?? '';
  element.insertAdjacentText('afterbegin', text);

  return element;
}
