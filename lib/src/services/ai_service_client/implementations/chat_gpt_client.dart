import 'dart:convert';
import 'package:graph_ui/utils.dart';
import 'package:http/http.dart' as http;

import '../chat_ai_response.dart';
import '../chat_ai_service_client.dart';

class ChatGptService implements ChatAiServiceClient {
  final apiKey = '';
  final _completionsApi = 'https://api.openai.com/v1/completions';

  @override
  Future<ChatAiResponse> converse(String userMessage) async {
    final response = await http.post(Uri.parse(_completionsApi),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer access_token',
        },
        body: jsonEncode(ChatGptCompletionRequest(
          // model: 'text-davinci-003',
          model: 'gpt-3.5-turbo',
          prompt: userMessage,
          maxTokens: 1024,
          n: 1,
          temperature: 0.5,
        )));

    final responseObject = jsonDecode(response.body);
    final choices = responseObject['choices'];
    final gptResponse = (choices[0]['text'] as String).trim().toString();

    return ChatGptCompletionsResponse(gptResponse);
  }

  /// Currently this instance of [ChatGptService] only supports
  /// training on text based data
  @override
  Future<void> trainModel(dynamic trainingData) async {
    final data = safeCast<String>(trainingData);

    if (data == null) return;

    await converse(data);
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
      'maxTokens': maxTokens,
      'n': n,
      'temperature': temperature,
    };
  }
}

class ChatGptCompletionsResponse extends ChatAiResponse {
  ChatGptCompletionsResponse(String aiResponse) : super(aiResponse);
}
