import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;
import 'package:react_material_ui/styles/theme_provider.dart' as mui_theme;
import 'package:w_chat/src/models/chat_model_utils.dart';

import '../redux/chat_agent_actions.dart';
import '../redux/chat_agent_view_context.dart';

part 'chat_agent_submit_form.over_react.g.dart';

mixin ChatAgentSubmitFormProps on UiProps {}

// ignore: non_constant_identifier_names
UiFactory<ChatAgentSubmitFormProps> ChatAgentSubmitForm = uiFunction((props) {
  final currentUser = useChatAgentSelector((s) => s.currentUser);
  final dispatch = useChatAgentDispatch();

  final StateHook<String> userInput = useState('');

  void _handleInput(SyntheticFormEvent event) {
    userInput.set(event.target.value as String);
  }

  void _onSubmit() {
    final newMessage =
        currentUser.buildChatMessage(userInput?.value?.trim() ?? '');

    if (newMessage.text.isEmpty) return;

    userInput.set('');

    dispatch(UserPromptSubmission(newMessage));
  }

  /// Submit user input if "Enter" is keyed without the
  /// intention of adding a new line (via the "Shift" key)
  void _onKeyDown(SyntheticKeyboardEvent event) {
    if (event.key == 'Enter' && !event.shiftKey) {
      event.preventDefault();
      _onSubmit();
    }
  }

  return (mui_theme.UnifyThemeProvider()
    ..key = 'chat-agent-submit-form'
    ..style = {'width': '100%'})((mui.Box())((mui.Stack()..spacing = 1)(
    (mui.TextField()
      ..sx = {'marginBottom': '10px'}
      ..onKeyDown = _onKeyDown
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
  )));
}, _$ChatAgentSubmitFormConfig);
