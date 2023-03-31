import 'package:graph_ui/ui_components.dart' show UserAvatar;
import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;

part 'chat_agent_dialog_item.over_react.g.dart';

mixin ChatAgentDialogItemProps on UiProps {
  ChatAgentMessage message;
}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentDialogItemProps> ChatAgentDialogItem = uiFunction((props) {
  final message = props.message;

  if (message == null) return null;

  ReactElement __renderAvatar() {
    final author = message.author;

    if (author is User) {
      return (UserAvatar()
        ..fullName = author.fullName
        ..userResourceId = author.resourceId)();
    }

    return (UserAvatar()
      ..fullName = 'Chat Gpt'
      ..userResourceId = 'chat-gpt')();
  }

  return (mui.ListItem()..divider = true)(
    __renderAvatar(),
    (mui.ListItemText()
      ..primary = message.text
      ..secondary = (mui.Stack()..direction = mui.StackDirection.row)(
        (Dom.span()..className = 'text-muted')(message.msgTime.toString()),
      ))(),
  );
}, _$ChatAgentDialogItemConfig);

class ChatAgentMessage {
  final String text;

  final DateTime msgTime;

  final Author author;

  ChatAgentMessage(this.text, this.author) : msgTime = DateTime.now();
}

abstract class Author {
  bool get isUser;
}

class User extends Author {
  String fullName;

  String resourceId;

  User(this.fullName, this.resourceId);

  @override
  bool get isUser => true;
}

class ChatGpt extends Author {
  @override
  bool get isUser => false;
}
