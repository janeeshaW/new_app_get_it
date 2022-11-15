// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      responseCode: json['response_code'] as String?,
      responseError: json['response_error'] as String?,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'response_error': instance.responseError,
    };
