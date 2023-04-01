import '../models/chat_models.sg.dart';

class UserPromptSubmission {
  final ChatMessage message;

  UserPromptSubmission(this.message);
}

class UserPromptSubmissionSuccess {
  final ChatMessage agentResponse;

  UserPromptSubmissionSuccess(this.agentResponse);
}

class UserPromptSubmissionFailed {
  final ChatMessage failedMessage;
  final String errorMessage;

  UserPromptSubmissionFailed(this.failedMessage, this.errorMessage);
}

class TrainAgent {
  final dynamic trainingData;

  TrainAgent(this.trainingData);
}

class TrainAgentSuccess {}
