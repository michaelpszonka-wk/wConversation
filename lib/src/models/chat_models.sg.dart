import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graph_ui/ui_core.dart' show newUuid;

part 'chat_models.sg.g.dart';

abstract class ChatMessage extends Object
    implements Built<ChatMessage, ChatMessageBuilder> {
  factory ChatMessage([updates(ChatMessageBuilder b)]) =>
      _$ChatMessage((ChatMessageBuilder b) => b
        ..uuid = newUuid()
        ..msgTime = DateTime.now()
        ..update(updates));

  ChatMessage._();

  static Serializer<ChatMessage> get serializer => _$chatMessageSerializer;

  String get uuid;

  @nullable
  String get text;

  DateTime get msgTime;

  Author get author;
}

abstract class Author {
  String get fullName;

  String get resourceId;
}

abstract class User extends Object
    with Author
    implements Built<User, UserBuilder> {
  factory User([Function(UserBuilder b) updates]) = _$User;
  User._();

  static Serializer<User> get serializer => _$userSerializer;

  @override
  String get fullName;

  @override
  String get resourceId;
}

abstract class Agent extends Object
    with Author
    implements Built<Agent, AgentBuilder> {
  factory Agent([Function(AgentBuilder b) updates]) = _$Agent;
  Agent._();

  @override
  String get fullName;

  @nullable
  @override
  String get resourceId;

  AgentType get type;

  static Serializer<Agent> get serializer => _$agentSerializer;
}

enum AgentType { chatgpt }
