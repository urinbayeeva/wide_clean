import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final bool userExists;

  AuthLoaded(this.userExists);

  @override
  List<Object?> get props => [userExists];
}

class AuthSmsSent extends AuthState {
  final String smsCode;

  AuthSmsSent(this.smsCode);

  @override
  List<Object?> get props => [smsCode];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
