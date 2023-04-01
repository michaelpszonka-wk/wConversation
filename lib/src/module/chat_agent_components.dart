import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:redux/redux.dart';
import 'package:w_chat/src/redux/chat_agent_view_state.sg.dart';
import 'package:w_module/w_module.dart';
import 'package:wdesk_sdk/experience_framework.dart';
import 'package:web_skin_dart/component2/icon.dart';

import '../ui/chat_agent_view.dart';

class ChatAgentModuleComponents extends ModuleComponents {

  final Store<ChatAgentViewState> _store;

  ChatAgentModuleComponents(this._store);

  @override
  ReactElement content() =>
      (ReduxProvider()..store = _store)(
          ChatAgentView()()
      );

  IconProps icon() => Icon()..glyph = IconGlyph.WORKIVA;

  PanelTitlePropsMixin panelTitle() =>
      PanelTitleV2()..defaultValue = 'ChatAgent';
}
