import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;
import 'package:web_skin_dart/component2/icon.dart';

import '../models/chat_models.sg.dart';

import 'chat_agent_dialog_item.dart';

part 'chat_agent_dialog.over_react.g.dart';

mixin ChatAgentDialogProps on UiProps {
  Set<ChatMessage> messages;

  bool isLoading;
}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentDialogProps> ChatAgentDialog = uiFunction((props) {
  final messages = props.messages ?? {};
  final isLoading = props.isLoading ?? false;

  ReactElement __renderMessage(ChatMessage msg) =>
      (ChatAgentDialogItem()..message = msg)();

  ReactElement __emptyView() => (mui.EmptyView()
    ..icon = (Icon()
      ..className = 'text-muted'
      ..glyph = IconGlyph.WORKIVA)())();

  final children = messages.isEmpty
      ? __emptyView()
      : (mui.MuiList()
        ..sx = {
          'borderLeft': (theme) => '.1rem solid ${theme.palette.divider}',
          'borderTop': (theme) => '.1rem solid ${theme.palette.divider}',
          'borderRight': (theme) => '.1rem solid ${theme.palette.divider}'
        })(
          messages.map(__renderMessage),
          isLoading
              ? (mui.CircularProgress()
                ..sx = {'margin': '1rem'}
                ..size = 25)()
              : null,
        );

  return (mui.Stack())(children);
}, _$ChatAgentDialogConfig);
