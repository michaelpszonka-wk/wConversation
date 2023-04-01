import 'chat_models.sg.dart';

extension ChatAuthorExtensions on Author {
  ChatMessage buildChatMessage(String prompt) =>
      ChatMessage((ChatMessageBuilder b) => b
        ..text = prompt
        ..author = this);
}