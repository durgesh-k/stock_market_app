import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/core/utils/utils.dart';
import 'package:stock_market_app/data/constants.dart';
import 'package:stock_market_app/presentation/screens/payment/bloc/payment_bloc.dart';
import 'package:stock_market_app/presentation/style/text_styles.dart';
import 'package:stock_market_app/presentation/widgets/buttons/button_small.dart';
import 'package:stock_market_app/presentation/widgets/snackbar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        _manageStates(context, state);
      },
      builder: (context, state) {
        if (state is PaymentLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "This is a paid feature. To proceed with the audio call, you need to pay ₹100.",
                      textAlign: TextAlign.center,
                      style: TextStyles.boldMediumLight()),
                  Utils.addVerticalSpace(30),
                  ButtonSmall(
                      onPressed: () {
                        context.read<PaymentBloc>().add(PaymentInitEvent());
                      },
                      text: "Make Payment")
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _manageStates(BuildContext context, PaymentState state) async {
    if (state is PaymentSuccess) {
      showSuccessSnackbar(
          context: context,
          message: "Payment Success! Redirecting you to Audio call");
      String loggedInUser = await SecureStorage.getStringFromSF(ValueKeys.user);
      String remoteUsername = "";
      if (loggedInUser.isNotEmpty && loggedInUser == "Bob") {
        remoteUsername = "Alice";
      } else {
        remoteUsername = "Bob";
      }
      context.pushReplacementNamed(AppRoutes.voiceCall.name,
          extra: remoteUsername);
    } else if (state is PaymentFailure) {
      showErrorSnackbar(
          context: context, message: 'Payment Failed: ${state.error}');
    }
  }
}
