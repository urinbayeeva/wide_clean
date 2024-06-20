// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) =>
    RegistrationModel(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$RegistrationModelToJson(RegistrationModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'phone': instance.phone,
      'country': instance.country,
    };
