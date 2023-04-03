import 'chat_models.sg.dart';

extension AgentTypeExtensions on AgentType {
  String get fullName {
    if (this == AgentType.chatgpt) return 'Chat Gpt';

    return null;
  }

  String get role {
    if(this == AgentType.chatgpt)
      return 'assistant';
    else if(this == AgentType.chatgpt_system)
      return 'system';

    return null;
  }

  String get userResourceId => null;
}

extension UserExtensions on User {
  String get role => 'user';
}