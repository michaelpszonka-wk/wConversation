import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

import '../services/ai_service_client/chat_ai_service_client.dart';
import 'chat_agent_actions.dart';
import 'chat_agent_view_state.sg.dart';

Iterable<Middleware<ChatAgentViewState>> chatAgentMiddlewares({
  @required ChatAiServiceClient chatClient,
}) =>
    [
      onUserPromptSubmission(chatClient),
      onUserPromptSubmissionSuccess(),
    ];

TypedMiddleware<ChatAgentViewState, UserPromptSubmission>
    onUserPromptSubmission(ChatAiServiceClient chatClient) =>
        TypedMiddleware((Store<ChatAgentViewState> store,
            UserPromptSubmission action, NextDispatcher next) {
          Future.delayed(Duration(seconds: 2), () {
            // _onChatGptResponse('Some mock data to send back');
          });

          // the real thing
          // final jsonData = json.encode(currentMsg);
          // chatClient.converse(action.userPrompt).then((res) {
          //   store.dispatch(UserPromptSubmissionSuccess(res.aiResponse));
          // }).catchError((e, st) {
          //   _log.severe('Error conversing with ai agent', e);
          //   store.dispatch(UserSubmissionFailed('Apologies, but there was an issue conversing with the agent'))
          // });

          next(action);
        });

TypedMiddleware<ChatAgentViewState, UserPromptSubmissionSuccess>
    onUserPromptSubmissionSuccess() =>
        TypedMiddleware((Store<ChatAgentViewState> store,
            UserPromptSubmissionSuccess action, NextDispatcher next) {
          // TODO do something real

          next(action);
        });
