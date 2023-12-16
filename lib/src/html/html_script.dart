/// The html script
String htmlScript({String? script}) {
  return '''
<script>
  const onCallback = (event, data) => {
    if (window.FlutterWebView) {
      const dataString = JSON.stringify({event, data});
      window.FlutterWebView.postMessage(dataString);
    }
  };

  const importFromXml = (xml, workspace) => {
    try {
      if (workspace.getAllBlocks(false).length > 0) return;
      Blockly.Xml.domToWorkspace(Blockly.utils.xml.textToDom(xml), workspace);
      return true;
    } catch (err) {
      onCallback('onError', err?.toString());
      return false;
    }
  };

  const importFromJson = (json, workspace) => {
    try {
      Blockly.serialization.workspaces.load(json, workspace);
      return true;
    } catch (err) {
      onCallback('onError', err?.toString());
      return false;
    }
  };

  const BlocklyEditor = () => {
    let _workspace = null;
    let _toolboxConfig = null;
    let _state = BlocklyState();
    let _readOnly = false;

    function init(params) {
      const element = document.querySelector('#blocklyEditor');
      if (!Blockly || !element || _toolboxConfig) {
        return;
      }

      const workspace = Blockly.inject(element, params?.workspaceConfiguration);

      if (workspace) {
        document.querySelector('.wrapper')?.classList.add('wrapper-active');
        _workspace = workspace;
        _toolboxConfig = params?.workspaceConfiguration?.toolbox || {contents: []};
        _readOnly = !!params?.workspaceConfiguration?.readOnly;
        onCallback('toolboxConfig', _toolboxConfig);
        onCallback('onInject', _state);
        _setState(params?.initial);
        _workspace.addChangeListener(listener);
      }
    }

    function dispose() {
      if (_workspace) {
        document.querySelector('.wrapper')?.classList.remove('wrapper-active');
        _workspace.removeChangeListener(listener);
        _workspace.dispose();
        let _workspace = null;
        let _toolboxConfig = null;
        let _state = BlocklyState();
        let _readOnly = false;
      }
    }

    function listener(event) {
      if (!event.isUiEvent && _workspace) {
        _saveData();
      }
    }

    function updateToolboxConfig(configuration) {
      try {
        if (
          configuration &&
          _workspace &&
          !_readOnly
        ) {
          _toolboxConfig = configuration;
          _workspace.updateToolbox(configuration);
          onCallback('toolboxConfig', _toolboxConfig);
        }
      } catch (err) {
        onCallback('onError', err?.toString());
      }
    }

    function updateState(newState) {
      try {
        if (newState) {
          _setState(newState);
        }
      } catch(err) {
        onCallback('onError', err?.toString());
      }
    }

    function state() {
      return _state;
    }

    function BlocklyState({xml, json} = {}) {
      return {
        xml: xml || '<xml xmlns="https://developers.google.com/blockly/xml"></xml>',
        json: json || {},
      };
    }

    function _setState(newState) {
      if (_workspace) {
        if (typeof newState === 'string') {
          importFromXml(newState, _workspace);
        } else if (newState && typeof newState === 'object') {
          importFromJson(newState, _workspace);
        }
        _saveData();
      }
    }

    function _saveData() {
      try {
        if (_workspace) {
          const newXml = Blockly.Xml.domToText(
            Blockly.Xml.workspaceToDom(_workspace),
          );
          if (newXml !== _state.xml) {
            _state = BlocklyState({
              xml: newXml,
              json: Blockly.serialization.workspaces.save(_workspace),
            });

            onCallback('onChange', _state);
            return true;
          }
        }
        return false;
      } catch (err) {
        onCallback('onError', err?.toString());
        return false;
      }
    }

    return {
      workspace: _workspace,
      init,
      dispose,
      state,
      updateToolboxConfig,
      updateState,
    };
  };

  const editor = BlocklyEditor();

  function handleEvent(params) {
    try {
      const {event, data} = typeof params === 'string' ? JSON.parse(params) : params;
      if (editor[event]) {
        editor[event](data);
      }
    } catch (err) {
      onCallback('onError', err?.toString());
    }
  }

  window.message = handleEvent;

  ${script ?? ''}
</script>
''';
}
