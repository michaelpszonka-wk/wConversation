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
          specifiedType:
              const FullType(BuiltSet, const [const FullType(ChatMessage)])),
      'currentUser',
      serializers.serialize(object.currentUser,
          specifiedType: const FullType(User)),
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
                      BuiltSet, const [const FullType(ChatMessage)]))
              as BuiltSet<Object>);
          break;
        case 'currentUser':
          result.currentUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
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
  final BuiltSet<ChatMessage> messages;
  @override
  final User currentUser;

  factory _$ChatAgentViewState(
          [void Function(ChatAgentViewStateBuilder) updates]) =>
      (new ChatAgentViewStateBuilder()..update(updates)).build();

  _$ChatAgentViewState._({this.isLoading, this.messages, this.currentUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'ChatAgentViewState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        messages, 'ChatAgentViewState', 'messages');
    BuiltValueNullFieldError.checkNotNull(
        currentUser, 'ChatAgentViewState', 'currentUser');
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
        messages == other.messages &&
        currentUser == other.currentUser;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, isLoading.hashCode), messages.hashCode),
        currentUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatAgentViewState')
          ..add('isLoading', isLoading)
          ..add('messages', messages)
          ..add('currentUser', currentUser))
        .toString();
  }
}

class ChatAgentViewStateBuilder
    implements Builder<ChatAgentViewState, ChatAgentViewStateBuilder> {
  _$ChatAgentViewState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SetBuilder<ChatMessage> _messages;
  SetBuilder<ChatMessage> get messages =>
      _$this._messages ??= new SetBuilder<ChatMessage>();
  set messages(SetBuilder<ChatMessage> messages) => _$this._messages = messages;

  UserBuilder _currentUser;
  UserBuilder get currentUser => _$this._currentUser ??= new UserBuilder();
  set currentUser(UserBuilder currentUser) => _$this._currentUser = currentUser;

  ChatAgentViewStateBuilder();

  ChatAgentViewStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _messages = $v.messages.toBuilder();
      _currentUser = $v.currentUser.toBuilder();
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
              messages: messages.build(),
              currentUser: currentUser.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
        _$failedField = 'currentUser';
        currentUser.build();
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
