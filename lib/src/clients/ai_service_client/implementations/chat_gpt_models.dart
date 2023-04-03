import 'package:meta/meta.dart';

class ChatGptMessage {
  final String role;
  final String content;

  Map<String, dynamic> toJson() => {
    'role' : role,
    'content': content
  };

  ChatGptMessage({@required this.role, @required this.content});
}