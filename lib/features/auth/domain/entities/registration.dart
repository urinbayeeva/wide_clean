import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {
  final String? userName;
  final String? password;
  final String? phone;
  final String? country;

  const RegistrationEntity({
    this.userName,
    this.password,
    this.phone,
    this.country,
  });

  @override
  List<Object?> get props {
    return [userName, password, phone, country];
  }
}
