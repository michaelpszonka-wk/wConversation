import 'package:redux/redux.dart';
import 'package:w_chat/src/redux/chat_agent_actions.dart';
import 'package:w_chat/src/redux/chat_agent_view_state.sg.dart';

class ChatAgentApi {
  Store<ChatAgentViewState> _store;

  ChatAgentApi(this._store);

  void trainModel(dynamic trainingData) {
    _store.dispatch(TrainAgent(trainingData));
  }
}
