import 'chat_ai_request.dart';
import 'chat_ai_response.dart';

abstract class ChatAiServiceClient {
  Future<ChatAiResponse> converse(ChatAiRequest request);
}
