import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:w_module/w_module.dart';
import 'package:wdesk_sdk/experience_framework.dart';

import '../models/chat_models.sg.dart';
import '../models/chat_model_extensions.dart';
import '../redux/chat_agent_middleware.dart';
import '../redux/chat_agent_reducer.dart';
import '../redux/chat_agent_view_state.sg.dart';
import '../services/ai_service_client/chat_ai_service_client.dart';
import '../services/ai_service_client/implementations/chat_gpt_client.dart';
import 'chat_agent_api.dart';
import 'chat_agent_components.dart';
import 'chat_agent_events.dart';

class ChatAgentModule extends Module {
  final DispatchKey _dispatchKey = new DispatchKey('chatAgentDispatchKey');

  final AppContext appContext;
  final ChatAiServiceClient chatClient;
  final AgentType agentType;

  ChatAgentModule({@required this.appContext, @required this.chatClient, @required this.agentType});

  ChatAgentModule.forChatGpt({@required this.appContext, ChatAiServiceClient chatClient})
      :
        chatClient = chatClient ?? ChatGptService(),
        agentType = AgentType.chatgpt;

  Store<ChatAgentViewState> _store;

  ChatAgentModuleComponents _components;

  ChatAgentApi _api;

  ChatAgentEvents _events;

  @override
  ChatAgentModuleComponents get components => _components;

  @override
  ChatAgentApi get api => _api;

  @override
  ChatAgentEvents get events => _events;

  @override
  Future<Null> onLoad() async {
    await super.onLoad();
    _events = ChatAgentEvents(_dispatchKey);

    _store = Store<ChatAgentViewState>(chatAgentReducer(),
        initialState: _buildInitialState(),
        middleware: [
          ...chatAgentMiddlewares(
            dispatchKey: _dispatchKey,
            chatClient: chatClient,
            events: _events,
          )
        ]);

    _api = ChatAgentApi(_store);
    _components = ChatAgentModuleComponents(_store);
  }

  ChatAgentViewState _buildInitialState() =>
      ChatAgentViewState((ChatAgentViewStateBuilder b) => b
        ..currentAgent = Agent((AgentBuilder ab) => ab
          ..fullName = agentType.fullName
          ..resourceId = agentType.userResourceId
          ..type = agentType
      ).toBuilder()
        ..currentUser = User((UserBuilder ub) => ub
              ..fullName = appContext.session.context.profile.displayName
              ..resourceId = appContext.session.context.userResourceId)
            .toBuilder());
}
