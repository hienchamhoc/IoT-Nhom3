import 'package:json_annotation/json_annotation.dart';

part 'light.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Light {
  final String? id;
  final String? name;
  final String? type;

  Light({this.id, this.type, this.name});

  factory Light.fromJson(Map<String, dynamic> json) => _$LightFromJson(json);

  Map<String, dynamic> toJson() => _$LightToJson(this);
}