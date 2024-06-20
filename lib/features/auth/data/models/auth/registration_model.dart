// ignore_for_file: use_super_parameters

import 'package:json_annotation/json_annotation.dart';
import 'package:wide_clean/features/auth/domain/entities/registration.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel extends RegistrationEntity {
  const RegistrationModel({
    String? userName,
    String? password,
    String? phone,
    String? country,
  }) : super(
          userName: userName,
          password: password,
          phone: phone,
          country: country,
        );

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);

  static RegistrationModel fromEntity(RegistrationEntity entity) {
    return RegistrationModel(
      userName: entity.userName,
      password: entity.password,
      phone: entity.phone,
      country: entity.country,
    );
  }
}
