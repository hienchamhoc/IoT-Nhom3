// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dht11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dht11 _$Dht11FromJson(Map<String, dynamic> json) => Dht11(
      id: json['id'] as String?,
      humidity: (json['humidity'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$Dht11ToJson(Dht11 instance) => <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'time': instance.time?.toIso8601String(),
    };
