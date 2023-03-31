class UserPromptSubmission {
  String userPrompt;

  UserPromptSubmission(this.userPrompt);
}

class UserPromptSubmissionSuccess {
  String agentResponse;

  UserPromptSubmissionSuccess(this.agentResponse);
}

class UserSubmissionFailed {
  String errorMessage;

  UserSubmissionFailed(this.errorMessage);
}
