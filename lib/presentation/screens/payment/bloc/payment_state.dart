part of 'payment_bloc.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  final String paymentId;

  PaymentSuccess(this.paymentId);
}

class PaymentFailure extends PaymentState {
  final String error;

  PaymentFailure(this.error);
}

class PaymentAuthFailure extends PaymentState {
  final String error;

  PaymentAuthFailure(this.error);
}
