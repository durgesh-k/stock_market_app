import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stock_market_app/core/utils/secure_storage.dart';
import 'package:stock_market_app/data/constants.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  late Razorpay _razorpay;

  var options = {
    //'key': 'rzp_live_ILgsfZCZoFIKMb',
    'amount': 100,
    'name': 'Acme Company Ltd',
    'description': 'Audio Call',
    'retry': {'enabled': true, 'max_count': 1},
    'send_sms_hash': true,
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    'external': {
      'wallets': ['paytm']
    }
  };

  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentInitEvent>(paymentInitEvent);
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }

  Future<FutureOr<void>> paymentInitEvent(
      PaymentInitEvent event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    _razorpay = Razorpay();
    String razorpayKey =
        await SecureStorage.getStringFromSF(ValueKeys.razorpayKey);
    if (razorpayKey.isNotEmpty) {
      final completer = Completer<void>();
      options.addAll({"key": razorpayKey});
      _makePayment(options, emit, completer);
      await completer.future;
    } else {
      emit(
          PaymentAuthFailure("Error authenticating payment. Please try again"));
    }
  }

  _makePayment(Map<String, dynamic> options, Emitter<PaymentState> emit,
      Completer<void> completer) {
    try {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (response) {
        emit(PaymentSuccess(response.paymentId));
        completer.complete();
      });

      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (response) {
        emit(PaymentFailure(response.message));
        completer.complete();
      });

      _razorpay.open(options);
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }
}
