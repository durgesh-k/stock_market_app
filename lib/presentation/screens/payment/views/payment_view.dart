import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/core/utils/utils.dart';
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

  _manageStates(BuildContext context, PaymentState state) {
    if (state is PaymentSuccess) {
      context.pushReplacementNamed(AppRoutes.voiceCall.name);
    } else if (state is PaymentFailure) {
      showErrorSnackbar(
          context: context, message: 'Payment Failed: ${state.error}');
    }
  }
}
