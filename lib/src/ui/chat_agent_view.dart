import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;
import 'package:react_material_ui/styles/theme_provider.dart' as mui_theme;

import '../redux/chat_agent_actions.dart';
import 'chat_agent_dialog.dart';
import 'chat_agent_dialog_item.dart';

part 'chat_agent_view.over_react.g.dart';

typedef OnUserSubmission = void Function(String userMessage);

mixin ChatAgentViewProps on UiProps {}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentViewProps> ChatAgentView = uiFunction((props) {
  final StateHook<String> userInput = useState('');
  final StateHook<Set<ChatAgentMessage>> messages = useState({});
  final StateHook<bool> isLoading = useState(false);
  final dispatch = useDispatch();

  void _handleInput(SyntheticFormEvent event) {
    userInput.set(event.target.value as String);
  }

  void _onChatGptResponse(String gptResponse) {
    messages.value.add(ChatAgentMessage(gptResponse, ChatGpt()));
    isLoading.set(false);
  }

  void _onSubmit() {
    final currentMsg = userInput?.value?.trim() ?? '';

    if (currentMsg.isEmpty) return;

    messages.value.add(ChatAgentMessage(currentMsg,
        User('Michael Pszonka', 'V0ZVc2VyHzUwNTUyMzY4MDMzOTU1ODQ')));

    userInput.set('');
    isLoading.set(true);

    dispatch(UserPromptSubmission(currentMsg));
  }

  return (mui_theme.UnifyThemeProvider()
    ..key = 'chat-gpt-section'
    ..style = {'width': '100%'})(
    (mui.Box())(
      (ChatAgentDialog()
        ..isLoading = isLoading.value
        ..messages = messages.value)(),
      (mui.Stack())(
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
          ..onClick = ((_) => _onSubmit)
          ..color = mui.ButtonColor.primary
          ..size = mui.ButtonSize.large)('Submit'),
      ),
    ),
  );
}, _$ChatAgentViewConfig);
