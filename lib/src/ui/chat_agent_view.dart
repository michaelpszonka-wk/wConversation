import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;
import 'package:react_material_ui/styles/theme_provider.dart' as mui_theme;
import 'package:w_chat/src/models/chat_model_utils.dart';

import '../redux/chat_agent_actions.dart';
import '../redux/chat_agent_view_context.dart';
import 'chat_agent_dialog.dart';

part 'chat_agent_view.over_react.g.dart';

mixin ChatAgentViewProps on UiProps {}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentViewProps> ChatAgentView = uiFunction((props) {
  final currentUser = useChatAgentSelector((s) => s.currentUser);
  final messages = useChatAgentSelector((s) => s.messages);
  final isLoading = useChatAgentSelector((s) => s.isLoading);
  final dispatch = useChatAgentDispatch();

  final StateHook<String> userInput = useState('');

  void _handleInput(SyntheticFormEvent event) {
    userInput.set(event.target.value as String);
  }

  void _onSubmit() {
    final newMessage = currentUser.buildChatMessage(userInput?.value?.trim() ?? '');

    if (newMessage.text.isEmpty) return;

    userInput.set('');

    dispatch(UserPromptSubmission(newMessage));
  }

  return (mui_theme.UnifyThemeProvider()
    ..key = 'chat-agent-view'
    ..style = {'width': '100%'})(
    (mui.Box())(
      (ChatAgentDialog()
        ..isLoading = isLoading
        ..messages = messages.toSet())(),
      (mui.Box())(
        (mui.Stack()
          ..divider = (mui.Divider()..orientation = 'horizontal')()
          ..spacing  = 1
        )(
          (mui.TextField()
            ..sx = {'marginBottom': '10px'}
            ..name = 'title'
            ..value = userInput.value
            ..onChange = _handleInput
            ..size = mui.TextFieldSize.small
            ..fullWidth = true
            ..multiline = true
            ..rows = 5)(),
          (mui.Button()
            ..sx = {'float': 'right'}
            ..onClick = ((_) => _onSubmit())
            ..color = mui.ButtonColor.primary
            ..size = mui.ButtonSize.large)('Submit'),
        ),
      )
    ),
  );
}, _$ChatAgentViewConfig);
