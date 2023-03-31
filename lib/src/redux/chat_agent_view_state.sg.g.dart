// GENERATED CODE - DO NOT MODIFY BY HAND

part of chat_agent_view_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatAgentViewState> _$chatAgentViewStateSerializer =
    new _$ChatAgentViewStateSerializer();

class _$ChatAgentViewStateSerializer
    implements StructuredSerializer<ChatAgentViewState> {
  @override
  final Iterable<Type> types = const [ChatAgentViewState, _$ChatAgentViewState];
  @override
  final String wireName = 'ChatAgentViewState';

  @override
  Iterable<Object> serialize(Serializers serializers, ChatAgentViewState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
      'messages',
      serializers.serialize(object.messages,
          specifiedType: const FullType(
              BuiltSet, const [const FullType(ChatAgentMessage)])),
    ];

    return result;
  }

  @override
  ChatAgentViewState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatAgentViewStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(ChatAgentMessage)]))
              as BuiltSet<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatAgentViewState extends ChatAgentViewState {
  @override
  final bool isLoading;
  @override
  final BuiltSet<ChatAgentMessage> messages;

  factory _$ChatAgentViewState(
          [void Function(ChatAgentViewStateBuilder) updates]) =>
      (new ChatAgentViewStateBuilder()..update(updates)).build();

  _$ChatAgentViewState._({this.isLoading, this.messages}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'ChatAgentViewState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        messages, 'ChatAgentViewState', 'messages');
  }

  @override
  ChatAgentViewState rebuild(
          void Function(ChatAgentViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatAgentViewStateBuilder toBuilder() =>
      new ChatAgentViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatAgentViewState &&
        isLoading == other.isLoading &&
        messages == other.messages;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isLoading.hashCode), messages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatAgentViewState')
          ..add('isLoading', isLoading)
          ..add('messages', messages))
        .toString();
  }
}

class ChatAgentViewStateBuilder
    implements Builder<ChatAgentViewState, ChatAgentViewStateBuilder> {
  _$ChatAgentViewState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SetBuilder<ChatAgentMessage> _messages;
  SetBuilder<ChatAgentMessage> get messages =>
      _$this._messages ??= new SetBuilder<ChatAgentMessage>();
  set messages(SetBuilder<ChatAgentMessage> messages) =>
      _$this._messages = messages;

  ChatAgentViewStateBuilder();

  ChatAgentViewStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _messages = $v.messages.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatAgentViewState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatAgentViewState;
  }

  @override
  void update(void Function(ChatAgentViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatAgentViewState build() {
    _$ChatAgentViewState _$result;
    try {
      _$result = _$v ??
          new _$ChatAgentViewState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'ChatAgentViewState', 'isLoading'),
              messages: messages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatAgentViewState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
