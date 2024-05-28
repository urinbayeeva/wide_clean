import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class RegistrationInProgress extends SignInState {}

class RegistrationSuccess extends SignInState {}

class RegistrationFailure extends SignInState {
  final String error;

  const RegistrationFailure(this.error);

  @override
  List<Object> get props => [error];
}
