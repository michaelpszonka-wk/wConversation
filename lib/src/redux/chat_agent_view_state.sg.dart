library chat_agent_view_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../models/chat_models.sg.dart';

part 'chat_agent_view_state.sg.g.dart';

abstract class ChatAgentViewState extends Object
    implements Built<ChatAgentViewState, ChatAgentViewStateBuilder> {
  factory ChatAgentViewState([updates(ChatAgentViewStateBuilder b)]) =>
      _$ChatAgentViewState((ChatAgentViewStateBuilder b) => b
        ..isLoading = false
        ..messages = SetBuilder({})
        ..update(updates));

  ChatAgentViewState._();

  static Serializer<ChatAgentViewState> get serializer =>
      _$chatAgentViewStateSerializer;

  bool get isLoading;

  BuiltSet<ChatMessage> get messages;

  User get currentUser;

  Agent get currentAgent;
}
