import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_cubit.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/bloc/voice_call_state.dart';
import 'package:stock_market_app/presentation/widgets/snackbar.dart';

class VoiceCallScreen extends StatelessWidget {
  const VoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceCallCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Voice Call'),
        ),
        body: Center(
          child: BlocConsumer<VoiceCallCubit, VoiceCallState>(
            listener: (context, state) {
              if (state is VoiceCallError) {
                showErrorSnackbar(context: context, message: state.error);
              }
            },
            builder: (context, state) => _handleStates(context, state),
          ),
        ),
      ),
    );
  }

  _handleStates(BuildContext context, VoiceCallState state) {
    if (state is VoiceCallInitial) {
      return ElevatedButton(
        onPressed: () {
          // Start the Agora call
          context.read<VoiceCallCubit>().initAgora();
        },
        child: const Text('Start Voice Call'),
      );
    } else if (state is VoiceCallInProgress) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Connecting...'),
        ],
      );
    } else if (state is VoiceCallJoined) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Remote User Joined: ${state.remoteUid}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Leave the channel
              context.read<VoiceCallCubit>().leaveChannel();
            },
            child: const Text('End Call'),
          ),
        ],
      );
    } else {
      return const Text('Unknown State');
    }
  }
}
