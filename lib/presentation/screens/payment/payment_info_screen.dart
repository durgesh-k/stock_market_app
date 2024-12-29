import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_app/presentation/screens/payment/bloc/payment_bloc.dart';
import 'package:stock_market_app/presentation/screens/payment/views/payment_view.dart';

class PaymentInfoScreen extends StatelessWidget {
  const PaymentInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay with Razorpay'),
      ),
      body: BlocProvider(
        create: (_) => PaymentBloc(),
        child: const PaymentView(),
      ),
    );
  }
}
