// Inside signIn_event.dart

import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends SignInEvent {
  final String userName;
  final String password;
  final String phone;
  final String country;

  const RegisterUser({
    required this.userName,
    required this.password,
    required this.phone,
    required this.country,
  });

  @override
  List<Object> get props => [userName, password, phone, country];
}
  