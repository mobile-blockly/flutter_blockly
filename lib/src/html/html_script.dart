String htmlScript({String? script = ''}) {
  return '''
<script>
window.onload = () => {
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
    let workspace = null;
    let toolboxConfig = null;
    let xml = null;
    let json = null;
    let readOnly = false;


    function init({workspaceConfiguration, initial}) {
      const element = document.querySelector('#blocklyEditor');
      if (!Blockly || !element || toolboxConfig) {
        return;
      }

      const worksp = Blockly.inject(element, workspaceConfiguration);
      if (worksp) {
        workspace = worksp;
        toolboxConfig = workspaceConfiguration?.toolbox || {contents: []};
        readOnly = !!workspaceConfiguration?.readOnly;
        onCallback('toolboxConfig', toolboxConfig);
        onCallback('onInject', {xml, json});
        _setState(initial);
        workspace.addChangeListener(listener);
      }
    }

    function listener(event) {
      if (!event.isUiEvent && workspace) {
        _saveData(workspace);
      }
    }

    function _saveData(workspace) {
      try {
        const newXml = Blockly.Xml.domToText(
          Blockly.Xml.workspaceToDom(workspace),
        );
        if (newXml !== xml) {
          xml = newXml;
          json = Blockly.serialization.workspaces.save(workspace);
          onCallback('onChange', {xml, json});
          return true;
        }
        return false;
      } catch (err) {
        onCallback('onError', err?.toString());
        return false;
      }
    }

    function _setState(newState) {
      if (workspace) {
        if (typeof newState === 'string') {
          importFromXml(newState, workspace);
        } else if (newState && typeof newState === 'object') {
          importFromJson(newState, workspace);
        }
        _saveData(workspace);
      }
    }

    function updateToolboxConfig(configuration) {
      try {
        if (
          configuration &&
          workspace &&
          !readOnly
        ) {
          toolboxConfig = configuration;
          workspace.updateToolbox(configuration);
          onCallback('toolboxConfig', configuration);
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
      return {
        xml,
        json,
      };
    }

    return {
      workspace,
      init,
      state,
      updateToolboxConfig,
      updateState,
    };
  };

  const editor = BlocklyEditor();

  function handleEvent({event, data}) {
    try {
      if (editor[event]) {
        editor[event](data);
      }
    } catch (err) {
      onCallback('onError', err?.toString());
    }
  }

  window.message = handleEvent;

  $script
}
</script>
''';
}
