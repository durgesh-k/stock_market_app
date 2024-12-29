part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class PaymentInitEvent extends PaymentEvent {}
