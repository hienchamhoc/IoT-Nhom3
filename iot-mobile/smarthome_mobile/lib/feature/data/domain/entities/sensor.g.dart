// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sensor _$SensorFromJson(Map<String, dynamic> json) => Sensor(
      data: (json['data'] as List<dynamic>?)?.map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$SensorToJson(Sensor instance) => <String, dynamic>{
      'data': instance.data,
    };

DataRoom _$DataRoomFromJson(Map<String, dynamic> json) => DataRoom(
      data: json['data'] == null
          ? null
          : StatusRoom.fromJson(json['data'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DataRoomToJson(DataRoom instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'name': instance.name,
    };

StatusRoom _$StatusRoomFromJson(Map<String, dynamic> json) => StatusRoom(
      status: json['status'] as int?,
    );

Map<String, dynamic> _$StatusRoomToJson(StatusRoom instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DataOperation _$DataOperationFromJson(Map<String, dynamic> json) =>
    DataOperation(
      temperature: json['temperature'] as String?,
      humidity: json['humidity'] as String?,
    );

Map<String, dynamic> _$DataOperationToJson(DataOperation instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      name: json['name'] as String?,
      data: json['data'] == null
          ? null
          : DataOperation.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'name': instance.name,
    };

DataTimeUsed _$DataTimeUsedFromJson(Map<String, dynamic> json) => DataTimeUsed(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TimeUsed.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DataTimeUsedToJson(DataTimeUsed instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };

TimeUsed _$TimeUsedFromJson(Map<String, dynamic> json) => TimeUsed(
      time: json['time'] as String?,
      led1: (json['led1'] as num?)?.toDouble(),
      led2: (json['led2'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TimeUsedToJson(TimeUsed instance) => <String, dynamic>{
      'time': instance.time,
      'led1': instance.led1,
      'led2': instance.led2,
    };
