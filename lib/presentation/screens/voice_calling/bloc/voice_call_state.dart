abstract class VoiceCallState {}

class VoiceCallInitial extends VoiceCallState {}

class VoiceCallInProgress extends VoiceCallState {}

class VoiceCallJoined extends VoiceCallState {
  final int? remoteUid;

  VoiceCallJoined({this.remoteUid});
}

class VoiceCallError extends VoiceCallState {
  final String error;

  VoiceCallError(this.error);
}
