// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_operations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightOperation _$LightOperationFromJson(Map<String, dynamic> json) =>
    LightOperation(
      id: json['id'] as String?,
      light: json['light'] as String?,
      type: json['type'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$LightOperationToJson(LightOperation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'time': instance.time?.toIso8601String(),
      'light': instance.light,
    };

LightDto _$LightDtoFromJson(Map<String, dynamic> json) => LightDto(
      data: json['data'] == null
          ? null
          : StatusLight.fromJson(json['data'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LightDtoToJson(LightDto instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.data?.toJson(),
    };

StatusLight _$StatusLightFromJson(Map<String, dynamic> json) => StatusLight(
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$StatusLightToJson(StatusLight instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
