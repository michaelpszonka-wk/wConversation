import 'chat_models.sg.dart';

extension AgentTypeExtensions on AgentType {
  String get fullName {
    if(this == AgentType.chatgpt)
      return 'Chat Gpt';

    return null;
  }

  String get userResourceId => null;
}