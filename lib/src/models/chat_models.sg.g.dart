// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatMessage> _$chatMessageSerializer = new _$ChatMessageSerializer();
Serializer<User> _$userSerializer = new _$UserSerializer();
Serializer<Agent> _$agentSerializer = new _$AgentSerializer();

class _$ChatMessageSerializer implements StructuredSerializer<ChatMessage> {
  @override
  final Iterable<Type> types = const [ChatMessage, _$ChatMessage];
  @override
  final String wireName = 'ChatMessage';

  @override
  Iterable<Object> serialize(Serializers serializers, ChatMessage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(String)),
      'msgTime',
      serializers.serialize(object.msgTime,
          specifiedType: const FullType(DateTime)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(Author)),
    ];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ChatMessage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatMessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msgTime':
          result.msgTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(Author)) as Author;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fullName',
      serializers.serialize(object.fullName,
          specifiedType: const FullType(String)),
      'resourceId',
      serializers.serialize(object.resourceId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'fullName':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'resourceId':
          result.resourceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AgentSerializer implements StructuredSerializer<Agent> {
  @override
  final Iterable<Type> types = const [Agent, _$Agent];
  @override
  final String wireName = 'Agent';

  @override
  Iterable<Object> serialize(Serializers serializers, Agent object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  Agent deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AgentBuilder().build();
  }
}

class _$ChatMessage extends ChatMessage {
  @override
  final String uuid;
  @override
  final String text;
  @override
  final DateTime msgTime;
  @override
  final Author author;

  factory _$ChatMessage([void Function(ChatMessageBuilder) updates]) =>
      (new ChatMessageBuilder()..update(updates)).build();

  _$ChatMessage._({this.uuid, this.text, this.msgTime, this.author})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uuid, 'ChatMessage', 'uuid');
    BuiltValueNullFieldError.checkNotNull(msgTime, 'ChatMessage', 'msgTime');
    BuiltValueNullFieldError.checkNotNull(author, 'ChatMessage', 'author');
  }

  @override
  ChatMessage rebuild(void Function(ChatMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatMessageBuilder toBuilder() => new ChatMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatMessage &&
        uuid == other.uuid &&
        text == other.text &&
        msgTime == other.msgTime &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uuid.hashCode), text.hashCode), msgTime.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatMessage')
          ..add('uuid', uuid)
          ..add('text', text)
          ..add('msgTime', msgTime)
          ..add('author', author))
        .toString();
  }
}

class ChatMessageBuilder implements Builder<ChatMessage, ChatMessageBuilder> {
  _$ChatMessage _$v;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  DateTime _msgTime;
  DateTime get msgTime => _$this._msgTime;
  set msgTime(DateTime msgTime) => _$this._msgTime = msgTime;

  Author _author;
  Author get author => _$this._author;
  set author(Author author) => _$this._author = author;

  ChatMessageBuilder();

  ChatMessageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uuid = $v.uuid;
      _text = $v.text;
      _msgTime = $v.msgTime;
      _author = $v.author;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatMessage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatMessage;
  }

  @override
  void update(void Function(ChatMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatMessage build() {
    final _$result = _$v ??
        new _$ChatMessage._(
            uuid: BuiltValueNullFieldError.checkNotNull(
                uuid, 'ChatMessage', 'uuid'),
            text: text,
            msgTime: BuiltValueNullFieldError.checkNotNull(
                msgTime, 'ChatMessage', 'msgTime'),
            author: BuiltValueNullFieldError.checkNotNull(
                author, 'ChatMessage', 'author'));
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final String fullName;
  @override
  final String resourceId;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.fullName, this.resourceId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(fullName, 'User', 'fullName');
    BuiltValueNullFieldError.checkNotNull(resourceId, 'User', 'resourceId');
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        fullName == other.fullName &&
        resourceId == other.resourceId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, fullName.hashCode), resourceId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('fullName', fullName)
          ..add('resourceId', resourceId))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _fullName;
  String get fullName => _$this._fullName;
  set fullName(String fullName) => _$this._fullName = fullName;

  String _resourceId;
  String get resourceId => _$this._resourceId;
  set resourceId(String resourceId) => _$this._resourceId = resourceId;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _resourceId = $v.resourceId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            fullName: BuiltValueNullFieldError.checkNotNull(
                fullName, 'User', 'fullName'),
            resourceId: BuiltValueNullFieldError.checkNotNull(
                resourceId, 'User', 'resourceId'));
    replace(_$result);
    return _$result;
  }
}

class _$Agent extends Agent {
  factory _$Agent([void Function(AgentBuilder) updates]) =>
      (new AgentBuilder()..update(updates)).build();

  _$Agent._() : super._();

  @override
  Agent rebuild(void Function(AgentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgentBuilder toBuilder() => new AgentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Agent;
  }

  @override
  int get hashCode {
    return 26618063;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('Agent').toString();
  }
}

class AgentBuilder implements Builder<Agent, AgentBuilder> {
  _$Agent _$v;

  AgentBuilder();

  @override
  void replace(Agent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Agent;
  }

  @override
  void update(void Function(AgentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Agent build() {
    final _$result = _$v ?? new _$Agent._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
