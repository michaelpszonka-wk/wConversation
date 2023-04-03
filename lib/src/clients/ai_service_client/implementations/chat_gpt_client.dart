import 'dart:convert';
import 'package:graph_ui/utils.dart';
import 'package:http/http.dart' as http;

import '../chat_ai_response.dart';
import '../chat_ai_service_client.dart';
import 'chat_gpt_models.dart';

class ChatGptClient implements ChatAiServiceClient {

  static String _systemContext = 'You are a helpful assistant';

  final apiKey = 'your_token';
  final _gptTurboApi = 'https://api.openai.com/v1/chat/completions';
  final _textDavinciThreeApi = 'https://api.openai.com/v1/completions';

  List<ChatGptMessage> messages = [ChatGptMessage(role: 'system', content: _systemContext)];

  @override
  Future<ChatAiResponse> converse(String userMessage) async {
    
    messages.add(ChatGptMessage(role: 'user', content: userMessage));


    final request = GptTurboCompletionRequest(
      // model: 'text-davinci-003',
      model: 'gpt-3.5-turbo',
      messages: messages,
      max_tokens: 1024,
      n: 1,
      temperature: 0.5,
    );

    final response = await http.post(Uri.parse(_gptTurboApi),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(request.toJson())
    );

    final responseObject = jsonDecode(response.body);
    final choices = responseObject['choices'];
    final message = choices[0]['message'];
    final gptResponse = (message['content'] as String).trim().toString();

    return ChatGptCompletionsResponse(gptResponse);

  }

  /// Currently this instance of [ChatGptClient] only supports
  /// training on text based data
  @override
  Future<void> trainModel(dynamic trainingData) async {
    final data = safeCast<String>(trainingData);

    if (data == null) return;

    print('Going to train model with $trainingData');
    await converse('Training data for user requests $data');
  }

  @override
  Future<void> clearChatHistory() async {
    messages = [ChatGptMessage(role: 'system', content: _systemContext)];
  }
}

class ChatGptCompletionRequest {
  final String model;
  final String prompt;
  final int max_tokens;
  final int n;
  final double temperature;

  ChatGptCompletionRequest(
      {this.model, this.prompt, this.max_tokens, this.n, this.temperature});

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'prompt': prompt,
      'max_tokens': max_tokens,
      'n': n,
      'temperature': temperature,
    };
  }
}

class GptTurboCompletionRequest {
  final String model;
  final List<ChatGptMessage> messages;
  final int max_tokens;
  final int n;
  final double temperature;

  GptTurboCompletionRequest(
      {this.model, this.messages, this.max_tokens, this.n, this.temperature});

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'max_tokens': max_tokens,
      'messages': messages.map((m) => m.toJson()).toList(),
      'n': n,
      'temperature': temperature,
    };
  }
}

class ChatGptCompletionsResponse extends ChatAiResponse {
  ChatGptCompletionsResponse(String aiResponse) : super(aiResponse);
}
