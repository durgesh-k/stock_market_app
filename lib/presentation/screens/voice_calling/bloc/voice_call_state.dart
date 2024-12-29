abstract class VoiceCallState {}

class VoiceCallInitial extends VoiceCallState {}

class VoiceCallInProgress extends VoiceCallState {}

class VoiceCallConnecting extends VoiceCallState {}

class VoiceCallJoined extends VoiceCallState {
  final int? remoteUid;

  VoiceCallJoined({this.remoteUid});
}

class VoiceCallError extends VoiceCallState {
  final String error;

  VoiceCallError(this.error);
}

class MicValueUpdated extends VoiceCallState {
  final bool enabled;

  MicValueUpdated(this.enabled);
}

class SpeakerValueUpdated extends VoiceCallState {
  final bool enabled;

  SpeakerValueUpdated(this.enabled);
}

class TerminateCall extends VoiceCallState {}
