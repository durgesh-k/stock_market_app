import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stock_market_app/core/utils/env_util.dart';
import 'package:stock_market_app/data/models/others/agora_creds_model.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_state.dart';

class VoiceCallCubit extends Cubit<VoiceCallState> {
  late RtcEngine _engine;
  int? _remoteUid;

  //Utils
  bool speakerphoneOn = false;
  bool micOn = true;

  VoiceCallCubit() : super(VoiceCallInitial());

  Future<void> initAgora() async {
    emit(VoiceCallConnecting());
    // Request microphone permission
    await [Permission.microphone].request();

    // Initialize the Agora RtcEngine
    try {
      AgoraCreds creds = await env.getAgoraCreds();
      _engine = await createAgoraRtcEngine();
      await _engine.initialize(
        RtcEngineContext(
          appId: creds.appId,
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );

      _engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            emit(VoiceCallInProgress());
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            _remoteUid = remoteUid;
            emit(VoiceCallJoined(remoteUid: remoteUid));
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            _remoteUid = null;
            emit(TerminateCall());
          },
        ),
      );
      joinChannel(creds);
    } catch (e) {
      emit(VoiceCallError('Error initializing Agora: $e'));
    }
  }

  Future<void> joinChannel(AgoraCreds creds) async {
    try {
      await _engine.joinChannel(
        token: creds.token,
        channelId: creds.channelId,
        options: const ChannelMediaOptions(
          autoSubscribeAudio: true,
          publishMicrophoneTrack: true,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ),
        uid: 0,
      );
    } catch (e) {
      emit(VoiceCallError('Error joining channel: $e'));
    }
  }

  Future<void> leaveChannel() async {
    await _engine.leaveChannel();
    await _engine.release();
    emit(VoiceCallInitial());
  }

  void toggleSpeaker() async {
    speakerphoneOn = !speakerphoneOn;
    await _engine.setEnableSpeakerphone(speakerphoneOn);
    emit(SpeakerValueUpdated(speakerphoneOn));
  }

  void toggleMic() {
    micOn = !micOn;
    _engine.muteLocalAudioStream(!micOn);
    emit(MicValueUpdated(micOn));
  }
}
