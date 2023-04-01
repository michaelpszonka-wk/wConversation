import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:w_chat/src/module/chat_agent_events.dart';
import 'package:w_module/w_module.dart';

import '../services/ai_service_client/chat_ai_service_client.dart';
import 'chat_agent_actions.dart';
import 'chat_agent_view_state.sg.dart';

Iterable<Middleware<ChatAgentViewState>> chatAgentMiddlewares({
  @required DispatchKey dispatchKey,
  @required ChatAgentEvents events,
  @required ChatAiServiceClient chatClient,
}) =>
    [
      onTrainAgent(dispatchKey, events, chatClient),
      onUserPromptSubmission(dispatchKey, events, chatClient),
      onUserPromptSubmissionSuccess(dispatchKey, events),
    ];

TypedMiddleware<ChatAgentViewState, UserPromptSubmission>
    onUserPromptSubmission(DispatchKey key, ChatAgentEvents events,
            ChatAiServiceClient chatClient) =>
        TypedMiddleware((Store<ChatAgentViewState> store,
            UserPromptSubmission action, NextDispatcher next) {
          events.onUserSubmission(action.message, key);
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
    onUserPromptSubmissionSuccess(DispatchKey key, ChatAgentEvents events) =>
        TypedMiddleware((Store<ChatAgentViewState> store,
            UserPromptSubmissionSuccess action, NextDispatcher next) {
          // TODO do something real
          events.onAgentResponse(action.agentResponse, key);

          next(action);
        });

TypedMiddleware<ChatAgentViewState, TrainAgent> onTrainAgent(DispatchKey key,
        ChatAgentEvents events, ChatAiServiceClient chatAiServiceClient) =>
    TypedMiddleware((Store<ChatAgentViewState> store, TrainAgent action,
        NextDispatcher next) {
      chatAiServiceClient.trainModel(action.trainingData).then((_) {
        store.dispatch(TrainAgentSuccess());
      }).catchError((e, stackTrace) {
        // TODO model training failed
      });

      next(action);
    });

TypedMiddleware<ChatAgentViewState, TrainAgentSuccess> onTrainAgentSuccess(
        DispatchKey key, ChatAgentEvents events) =>
    TypedMiddleware((Store<ChatAgentViewState> store, TrainAgentSuccess action,
        NextDispatcher next) {
      events.onAgentTrained(null, key);

      next(action);
    });
