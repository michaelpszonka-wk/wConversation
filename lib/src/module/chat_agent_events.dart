import 'package:w_module/w_module.dart';

class ChatAgentEvents extends EventsCollection {
  // final Event<String> onChatGptResponse;
  final Event<String> onUserSubmission;

  ChatAgentEvents(DispatchKey key)
      :
        // onChatGptResponse = Event(key),
        onUserSubmission = Event(key),
        super(key) {
    [
      // onChatGptResponse,
      onUserSubmission,
    ].forEach(manageEvent);
  }
}
