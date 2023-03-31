import 'dart:convert';
import 'package:http/http.dart' as http;

import '../chat_ai_request.dart';
import '../chat_ai_response.dart';
import '../chat_ai_service_client.dart';

class ChatGptService implements ChatAiServiceClient {
  final apiKey = '';

  @override
  Future<ChatAiResponse> converse(ChatAiRequest request) async {
    final response =
        await http.post(Uri.parse('https://api.openai.com/v1/completions'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer access_token',
            },
            body: jsonEncode(ChatGptCompletionRequest(
              // model: 'text-davinci-003',
              model: 'gpt-3.5-turbo',
              prompt: request.userMessage,
              maxTokens: 1024,
              n: 1,
              temperature: 0.5,
            )));

    final responseObject = jsonDecode(response.body);
    final choices = responseObject['choices'];
    final gptResponse = (choices[0]['text'] as String).trim().toString();

    return ChatGptCompletionsResponse(gptResponse);
  }
}

class ChatGptCompletionRequest {
  final String model;
  final String prompt;
  final int maxTokens;
  final int n;
  final double temperature;

  ChatGptCompletionRequest(
      {this.model, this.prompt, this.maxTokens, this.n, this.temperature});

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'prompt': prompt,
      'max_tokens': maxTokens,
      'n': n,
      'temperature': temperature,
    };
  }
}

class ChatGptCompletionsRequest extends ChatAiRequest {
  ChatGptCompletionsRequest(String userMessage) : super(userMessage);
}

class ChatGptCompletionsResponse extends ChatAiResponse {
  ChatGptCompletionsResponse(String aiResponse) : super(aiResponse);
}
