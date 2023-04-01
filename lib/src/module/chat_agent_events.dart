import 'package:w_chat/src/models/chat_models.sg.dart';
import 'package:w_module/w_module.dart';

class ChatAgentEvents extends EventsCollection {
  final Event onAgentTrained;
  final Event<ChatMessage> onAgentResponse;
  final Event<ChatMessage> onUserSubmission;

  ChatAgentEvents(DispatchKey key)
      : onAgentResponse = Event<ChatMessage>(key),
        onAgentTrained = Event(key),
        onUserSubmission = Event<ChatMessage>(key),
        super(key) {
    [
      onAgentResponse,
      onUserSubmission,
    ].forEach(manageEvent);
  }
}
