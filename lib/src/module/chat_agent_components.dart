import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:react_material_ui/styles/theme_provider.dart' as mui_theme;
import 'package:redux/redux.dart';
import 'package:w_chat/src/redux/chat_agent_view_state.sg.dart';
import 'package:w_module/w_module.dart';
import 'package:wdesk_sdk/experience_framework.dart';
import 'package:web_skin_dart/component2/icon.dart';

import '../ui/chat_agent_dialog.dart';
import '../ui/chat_agent_submit_form.dart';

class ChatAgentModuleComponents extends ModuleComponents {
  final Store<ChatAgentViewState> _store;

  ChatAgentModuleComponents(this._store);

  @override
  ReactElement content() => (mui_theme.UnifyThemeProvider()
    ..key = 'chat-agent-dialog'
    ..style = {
      'width': '100%'
    })((ReduxProvider()..store = _store)(ChatAgentDialog()()));

  ReactElement chatSubmissionFormFooter() => (mui_theme.UnifyThemeProvider()
    ..key = 'chat-agent-submit-form'
    ..style = {
      'width': '100%'
    })((ReduxProvider()..store = _store)(ChatAgentSubmitForm()()));

  IconProps icon() => Icon()..glyph = IconGlyph.WORKIVA;

  PanelTitlePropsMixin panelTitle() =>
      PanelTitleV2()..defaultValue = 'Workiva Assistant';
}
