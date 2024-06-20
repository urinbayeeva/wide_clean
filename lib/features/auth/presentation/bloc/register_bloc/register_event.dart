import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class CheckUserExists extends RegistrationEvent {
  final String phoneNumber;

  const CheckUserExists(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SendSmsCode extends RegistrationEvent {
  final String phoneNumber;

  const SendSmsCode(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class VerifySmsCode extends RegistrationEvent {
  final String phoneNumber;
  final String smsCode;

  const VerifySmsCode(this.phoneNumber, this.smsCode);

  @override
  List<Object> get props => [phoneNumber, smsCode];
}

class RegisterUser extends RegistrationEvent {
  const RegisterUser();
}
