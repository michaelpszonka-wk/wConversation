import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:w_module/w_module.dart';

import '../redux/chat_agent_middleware.dart';
import '../redux/chat_agent_reducer.dart';
import '../redux/chat_agent_view_state.sg.dart';
import '../services/ai_service_client/chat_ai_service_client.dart';
import 'chat_agent_api.dart';
import 'chat_agent_components.dart';
import 'chat_agent_events.dart';

class ChatAgentModule extends Module {
  final DispatchKey _dispatchKey = new DispatchKey('chatGpt');

  final ChatAiServiceClient chatClient;

  ChatAgentModule({@required this.chatClient});

  Store<ChatAgentViewState> _store;

  ChatAgentModuleComponents _components;

  ChatAgenApi _api;

  ChatAgentEvents _events;

  @override
  ChatAgentModuleComponents get components => _components;

  @override
  ChatAgenApi get api => _api;

  @override
  ChatAgentEvents get events => _events;

  @override
  Future<Null> onLoad() async {
    await super.onLoad();

    _store = Store<ChatAgentViewState>(chatAgentReducer(),
        middleware: [...chatAgentMiddlewares(chatClient: chatClient)]);

    _events = ChatAgentEvents(_dispatchKey);
    _api = ChatAgenApi();
    _components = ChatAgentModuleComponents();
  }
}
