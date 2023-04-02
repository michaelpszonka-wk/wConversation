import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;
import 'package:web_skin_dart/component2/icon.dart';

import '../models/chat_models.sg.dart';

import '../redux/chat_agent_view_context.dart';
import 'chat_agent_dialog_item.dart';
import 'use_previous_messages.dart';

part 'chat_agent_dialog.over_react.g.dart';

mixin ChatAgentDialogProps on UiProps {}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentDialogProps> ChatAgentDialog = uiFunction((props) {
  final messages = useChatAgentSelector((s) => s.messages);
  final isLoading = useChatAgentSelector((s) => s.isLoading);
  final prevMessages = usePreviousMessages(messages);
  final dialogAnchor = useRef<DivElement>(null);
  void scrollToBottom() => findDomNode(dialogAnchor.current)?.scrollIntoView();

  useEffect(() {
    if (prevMessages != messages) scrollToBottom();
  }, [messages]);

  ReactElement __renderMessage(ChatMessage msg) =>
      (ChatAgentDialogItem()..message = msg)();

  ReactElement __emptyView() =>
      (mui.EmptyView()..icon = (Icon()..glyph = IconGlyph.WORKIVA)())();

  if (messages.isEmpty) return __emptyView();

  return (mui.Stack())(
      (mui.MuiList()
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
              : null),
      (Dom.div()
        ..key = 'chat-dialog-anchor'
        ..ref = dialogAnchor
        ..style = {'float': 'left', 'clear': 'both'})());
}, _$ChatAgentDialogConfig);
