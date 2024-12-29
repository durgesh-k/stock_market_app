import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/gen/colors.gen.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_cubit.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_state.dart';
import 'package:stock_market_app/presentation/style/custom_decorations.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';
import 'package:stock_market_app/presentation/widgets/snackbar.dart';

class VoiceCallScreen extends StatefulWidget {
  const VoiceCallScreen({super.key, required this.remoteUsername});
  final String remoteUsername;

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  VoiceCallCubit voiceCallCubit = VoiceCallCubit();

  //Utils
  bool speakerphoneOn = false;
  bool micOn = true;

  @override
  void initState() {
    super.initState();
    voiceCallCubit.initAgora();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            terminateCall();
          },
        ),
        title: const Text('Voice Call'),
      ),
      body: Center(
        child: BlocConsumer<VoiceCallCubit, VoiceCallState>(
          bloc: voiceCallCubit,
          listener: (context, state) {
            if (state is VoiceCallError) {
              showErrorSnackbar(context: context, message: state.error);
            } else if (state is MicValueUpdated) {
              setState(() {
                micOn = state.enabled;
              });
            } else if (state is SpeakerValueUpdated) {
              setState(() {
                speakerphoneOn = state.enabled;
              });
            } else if (state is TerminateCall) {
              terminateCall();
            }
          },
          buildWhen: (previous, current) =>
              current is VoiceCallConnecting ||
              current is VoiceCallJoined ||
              current is VoiceCallInProgress,
          builder: (context, state) => _handleStates(context, state),
        ),
      ),
    );
  }

  _handleStates(BuildContext context, VoiceCallState state) {
    /* if (state is VoiceCallInitial) {
      return ElevatedButton(
        onPressed: () {
          context.read<VoiceCallCubit>().initAgora();
        },
        child: const Text('Start Voice Call'),
      );
    } else */
    if (state is VoiceCallConnecting) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              'Connecting...',
              style: TextStyles.boldMediumLight(),
            ),
          ],
        ),
      );
    } else if (state is VoiceCallInProgress) {
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              'Connected\nWaiting for ${widget.remoteUsername}',
              textAlign: TextAlign.center,
              style: TextStyles.boldMediumLight(),
            ),
          ],
        ),
      );
    } else if (state is VoiceCallJoined) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox.shrink()),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ColorName.primary),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                widget.remoteUsername.substring(0, 1).toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
            ),
          ),
          Utils.addVerticalSpace(20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green)),
              Utils.addHorizontalSpace(10),
              Text(
                'Connected',
                style: TextStyles.boldMediumLight(),
              ),
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          actionPanel(),
          const Expanded(child: SizedBox.shrink()),
        ],
      );
    } else {
      return const Text('Unknown State');
    }
  }

  actionPanel() => Container(
        decoration: CustomDecorations.customBorderedDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton.filled(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(speakerphoneOn
                          ? ColorName.primary
                          : ColorName.primaryDark)),
                  onPressed: () {
                    voiceCallCubit.toggleSpeaker();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      speakerphoneOn ? Icons.phone : Icons.speaker_phone,
                      color: ColorName.background,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            micOn ? ColorName.primary : ColorName.primaryDark)),
                    onPressed: () {
                      voiceCallCubit.toggleMic();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        micOn ? Icons.mic : Icons.mic_off,
                        color: ColorName.background,
                      ),
                    )),
              ),
              IconButton.filled(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    terminateCall();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RotationTransition(
                        turns: AlwaysStoppedAnimation(135 / 360),
                        child: Icon(
                          Icons.phone,
                          color: ColorName.background,
                        )),
                  )),
            ],
          ),
        ),
      );

  terminateCall() {
    voiceCallCubit.leaveChannel();
    context.pop();
  }
}
