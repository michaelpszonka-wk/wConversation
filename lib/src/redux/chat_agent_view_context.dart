import 'package:over_react/over_react_redux.dart';

import 'chat_agent_view_state.sg.dart';

final useChatAgentSelector = createSelectorHook<ChatAgentViewState>();
final useChatAgentDispatch = createDispatchHook<ChatAgentViewState>();
