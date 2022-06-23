// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handle_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandleResponseModel _$HandleResponseModelFromJson(Map<String, dynamic> json) =>
    HandleResponseModel(
      message: json['message'] as String?,
      code: json['code'] as String?,
      body: json['body'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$HandleResponseModelToJson(
        HandleResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'body': instance.body,
    };
