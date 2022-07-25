// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Light _$LightFromJson(Map<String, dynamic> json) => Light(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LightToJson(Light instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
