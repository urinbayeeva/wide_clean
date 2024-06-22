// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      id: json['id'] as String?,
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
      'error': instance.error,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
    };
