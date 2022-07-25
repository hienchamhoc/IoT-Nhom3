import 'package:json_annotation/json_annotation.dart';

part 'sensor.g.dart';

@JsonSerializable(explicitToJson: true)
class Sensor {
  final List<Object>? data;
  Sensor({this.data});

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

  Map<String, dynamic> toJson() => _$SensorToJson(this);

  DataRoom get livingRoom => DataRoom.fromJson(data![0] as Map<String, dynamic>);
  DataRoom get bedRoom => DataRoom.fromJson(data![1] as Map<String, dynamic>);
  Operation get operation => Operation.fromJson(data![2] as Map<String, dynamic>);
  DataTimeUsed get dataTimeUsed => DataTimeUsed.fromJson(data![3] as Map<String, dynamic>);
}

@JsonSerializable(explicitToJson: true)
class DataRoom {
  final StatusRoom? data;
  final String? name;
  DataRoom({this.data,this.name});

  factory DataRoom.fromJson(Map<String, dynamic> json) => _$DataRoomFromJson(json);

  Map<String, dynamic> toJson() => _$DataRoomToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatusRoom {
  final int? status;
  StatusRoom({this.status});

  bool get state => status != null && status! == 1;

  factory StatusRoom.fromJson(Map<String, dynamic> json) => _$StatusRoomFromJson(json);

  Map<String, dynamic> toJson() => _$StatusRoomToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataOperation {
  final String? temperature;
  final String? humidity;
  DataOperation({this.temperature, this.humidity});
  factory DataOperation.fromJson(Map<String, dynamic> json) => _$DataOperationFromJson(json);

  Map<String, dynamic> toJson() => _$DataOperationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Operation {
  final DataOperation? data;
  final String? name;
  Operation({this.name, this.data});
  factory Operation.fromJson(Map<String, dynamic> json) => _$OperationFromJson(json);

  Map<String, dynamic> toJson() => _$OperationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataTimeUsed {
  final List<TimeUsed>? data;
  final String? name;
  DataTimeUsed({this.data, this.name});
  factory DataTimeUsed.fromJson(Map<String, dynamic> json) => _$DataTimeUsedFromJson(json);

  Map<String, dynamic> toJson() => _$DataTimeUsedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TimeUsed {
  final String? time;
  final double? led1;
  final double? led2;
  TimeUsed({this.time, this.led1, this.led2});
  factory TimeUsed.fromJson(Map<String, dynamic> json) => _$TimeUsedFromJson(json);

  Map<String, dynamic> toJson() => _$TimeUsedToJson(this);
}