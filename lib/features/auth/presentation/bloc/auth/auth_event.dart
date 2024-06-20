import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckUserByPhoneEvent extends AuthEvent {
  final String phoneNumber;

  CheckUserByPhoneEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class SendSmsCodeEvent extends AuthEvent {
  final String phoneNumber;

  SendSmsCodeEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}
