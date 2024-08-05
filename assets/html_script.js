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

function nullToUndefined(data, defaultData) {
  if (data === null || typeof data === 'undefined') {
    return defaultData;
  } else if (Array.isArray(data)) {
    return data.map(item => nullToUndefined(item, defaultData?.[0]));
  } else if (typeof data === 'object') {
    const tempObj = {};
    for (let key in data) {
      tempObj[key] = nullToUndefined(data[key], defaultData?.[key]);
    }
    return tempObj;
  } else {
    return data;
  }
}

const BlocklyEditor = () => {
  let _workspace = null;
  let _toolboxConfig = null;
  let _state = BlocklyState();
  let _readOnly = false;
  let _code = {
    dart: '',
    js: '',
    lua: '',
    php: '',
    python: '',
  };

  function init(params) {
    const element = document.querySelector('#blocklyEditor');
    if (!Blockly || !element || _toolboxConfig) {
      return;
    }

    const workspace = Blockly.inject(
      element,
      nullToUndefined(params?.workspaceConfiguration),
    );

    if (workspace) {
      document.querySelector('.wrapper')?.classList.add('wrapper-active');
      _workspace = workspace;
      _toolboxConfig = params?.workspaceConfiguration?.toolbox || {contents: []};
      _readOnly = !!params?.workspaceConfiguration?.readOnly;
      onCallback('toolboxConfig', _toolboxConfig);
      onCallback('onInject', _getData());
      _setState(params?.initial);
      _workspace.addChangeListener(listener);
    }
  }

  function dispose() {
    if (_workspace) {
      document.querySelector('.wrapper')?.classList.remove('wrapper-active');
      _workspace.removeChangeListener(listener);
      _workspace.dispose();
      _workspace = null;
      _toolboxConfig = null;
      _state = BlocklyState();
      _readOnly = false;
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

  function code() {
    return _code;
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
          _saveCode()
          onCallback('onChange', _getData());
          return true;
        }
      }
      return false;
    } catch (err) {
      onCallback('onError', err?.toString());
      return false;
    }
  }

  function _saveCode() {
    if (_workspace) {
      if(window.dart) _code.dart = dart.dartGenerator?.workspaceToCode(_workspace);
      if(window.javascript) _code.js = javascript.javascriptGenerator?.workspaceToCode(_workspace);
      if(window.lua) _code.lua = lua.luaGenerator?.workspaceToCode(_workspace);
      if(window.php) _code.php = php.phpGenerator?.workspaceToCode(_workspace);
      if(window.python) _code.python = python.pythonGenerator?.workspaceToCode(_workspace);
    }
  }

  function _getData() {
    return {
      ..._state,
      ..._code,
    };
  }

  return {
    workspace: _workspace,
    init,
    dispose,
    state,
    code,
    updateToolboxConfig,
    updateState,
  };
};

const editor = BlocklyEditor();

const events = {
  eval: function (data) {
    try {
      eval(data);
    } catch (err) {
      onCallback('onError', err?.toString());
    }
  },
};

function handleEvent(params) {
  try {
    const {event, data} = typeof params === 'string' ? JSON.parse(params) : params;
    if (editor[event]) {
      editor[event](data);
    } else if (events[event]) {
      events[event](data);
    }
  } catch (err) {
    onCallback('onError', err?.toString());
  }
}

window.message = handleEvent;
