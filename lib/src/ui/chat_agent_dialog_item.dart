import 'package:graph_ui/ui_components.dart' show UserAvatar;
import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;

import '../models/chat_models.sg.dart';

part 'chat_agent_dialog_item.over_react.g.dart';

mixin ChatAgentDialogItemProps on UiProps {
  ChatMessage message;
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
