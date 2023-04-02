import 'package:built_collection/built_collection.dart';
import 'package:over_react/over_react.dart';

import '../models/chat_models.sg.dart';

BuiltSet<ChatMessage> usePreviousMessages(BuiltSet<ChatMessage> prevMessages) {
  final ref = useRef<BuiltSet<ChatMessage>>();

  useEffect(() {
    ref.current = prevMessages;
  });
  return ref.current;
}
