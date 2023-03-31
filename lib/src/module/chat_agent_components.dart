import 'package:over_react/over_react.dart';
import 'package:w_module/w_module.dart';
import 'package:wdesk_sdk/experience_framework.dart';
import 'package:web_skin_dart/component2/icon.dart';

import '../ui/chat_agent_view.dart';

class ChatAgentModuleComponents extends ModuleComponents {
  @override
  ReactElement content() => ChatAgentView()();

  IconProps icon() => Icon()..glyph = IconGlyph.WORKIVA;

  PanelTitlePropsMixin panelTitle() =>
      PanelTitleV2()..defaultValue = 'ChatAgent';
}
