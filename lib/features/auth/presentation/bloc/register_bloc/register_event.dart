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
  final String name;
  final String password;
  final String phoneNumber;
  final String country;

  const RegisterUser(this.name, this.password, this.phoneNumber, this.country);

  @override
  List<Object> get props => [name, password, phoneNumber, country];
}
