import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class UserExists extends RegistrationState {}

class UserDoesNotExist extends RegistrationState {}

class SmsCodeSent extends RegistrationState {}

class SmsCodeVerified extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  final String error;

  const RegistrationFailure(this.error);

  @override
  List<Object> get props => [error];
}
