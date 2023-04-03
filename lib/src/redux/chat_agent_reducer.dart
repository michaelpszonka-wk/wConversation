import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:w_chat/src/redux/chat_agent_actions.dart';

import 'chat_agent_view_state.sg.dart';

Reducer<ChatAgentViewState> chatAgentReducer() => combineReducers([
      TypedReducer<ChatAgentViewState, UserPromptSubmission>(
          onUserPromptSubmitted),
      TypedReducer<ChatAgentViewState, UserPromptSubmissionSuccess>(
          onUserPromptSuccess),
      TypedReducer<ChatAgentViewState, UserPromptSubmissionFailed>(
          onUserPromptFailed),
    ]);

ChatAgentViewState onUserPromptSubmitted(
        ChatAgentViewState state, UserPromptSubmission action) =>
    state.rebuild((b) => b
      ..messages = SetBuilder({...state.messages, action.message})
      ..isLoading = true);

ChatAgentViewState onUserPromptSuccess(
        ChatAgentViewState state, UserPromptSubmissionSuccess action) =>
    state.rebuild((b) => b
      ..messages = SetBuilder({...state.messages, action.agentResponse})
      ..isLoading = false);

ChatAgentViewState onUserPromptFailed(
        ChatAgentViewState state, UserPromptSubmissionFailed action) {
return state.rebuild((b) => b
  ..isLoading = false
  ..messages = SetBuilder(state.messages.toList()..removeWhere((msg) => msg.uuid == action.failedMessage.uuid)));

}
