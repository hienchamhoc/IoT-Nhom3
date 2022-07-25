import 'package:json_annotation/json_annotation.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/light.dart';

part 'light_operations.g.dart';

@JsonSerializable(explicitToJson: true)
class LightOperation {
  final String? id;
  final String? type;
  final DateTime? time;
  final String? light;

  LightOperation({this.id, this.light, this.type, this.time});

  factory LightOperation.fromJson(Map<String, dynamic> json) => _$LightOperationFromJson(json);

  Map<String, dynamic> toJson() => _$LightOperationToJson(this);

}

class LightOperationType {
  static const String turnOn = 'TURN_ON';
  static const String turnOff = 'TURN_OFF';
}

@JsonSerializable(explicitToJson: true)
class LightDto {
  final String? name;
  final StatusLight? data;
  LightDto({this.data, this.name});
  factory LightDto.fromJson(Map<String, dynamic> json) => _$LightDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LightDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatusLight {
  final bool? status;
  StatusLight({this.status});
  factory StatusLight.fromJson(Map<String, dynamic> json) => _$StatusLightFromJson(json);

  Map<String, dynamic> toJson() => _$StatusLightToJson(this);
}
