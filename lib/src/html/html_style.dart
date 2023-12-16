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
.wrapper-web {
  position: absolute;
  z-index: 10;
  top: 0;
  left: 100%;
}
.wrapper-active {
  left: 0;
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
