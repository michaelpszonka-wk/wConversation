library chat_agent_view_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../ui/chat_agent_dialog_item.dart';

part 'chat_agent_view_state.sg.g.dart';

abstract class ChatAgentViewState extends Object
    implements Built<ChatAgentViewState, ChatAgentViewStateBuilder> {
  factory ChatAgentViewState([Function(ChatAgentViewStateBuilder b) updates]) =
      _$ChatAgentViewState;
  ChatAgentViewState._();

  static Serializer<ChatAgentViewState> get serializer =>
      _$chatAgentViewStateSerializer;

  bool get isLoading;

  BuiltSet<ChatAgentMessage> get messages;
}
