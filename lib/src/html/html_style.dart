/// The html style
String htmlStyle({String? style}) {
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
  width: 100%;
  height: 100%;
  min-width: 320px;
  min-height: 320px;
  background-color: #fff;
  box-sizing: border-box;
}
.wrap-container {
  display: flex;
  flex: 1 0 auto;
  flex-direction: column;
  box-sizing: border-box;
}
${style ?? ''}
</style>
''';
}
