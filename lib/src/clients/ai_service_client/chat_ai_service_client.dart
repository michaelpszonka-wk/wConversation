import 'chat_ai_response.dart';

abstract class ChatAiServiceClient {
  Future<void> trainModel(dynamic trainingData);
  Future<ChatAiResponse> converse(String userMessage);
  Future<void> clearChatHistory();
}
