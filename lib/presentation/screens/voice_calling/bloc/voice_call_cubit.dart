import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_state.dart';

class VoiceCallCubit extends Cubit<VoiceCallState> {
  static const appId = "<-- Insert App Id -->";
  static const token = "<-- Insert Token -->";
  static const channel = "<-- Insert Channel Name -->";

  late RtcEngine _engine;
  int? _remoteUid;

  VoiceCallCubit() : super(VoiceCallInitial());

  Future<void> initAgora() async {
    // Request microphone permission
    await [Permission.microphone].request();

    // Initialize the Agora RtcEngine
    try {
      _engine = await createAgoraRtcEngine();
      await _engine.initialize(
        const RtcEngineContext(
          appId: appId,
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
            emit(VoiceCallInProgress());
          },
        ),
      );
    } catch (e) {
      emit(VoiceCallError('Error initializing Agora: $e'));
    }
  }

  Future<void> joinChannel() async {
    try {
      await _engine.joinChannel(
        token: token,
        channelId: channel,
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
}
