import 'package:json_annotation/json_annotation.dart';

part 'dht11.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Dht11 {
  final String? id;
  final double? temperature;
  final double? humidity;
  final DateTime? time;

  Dht11({this.id, this.humidity, this.temperature, this.time});

  factory Dht11.fromJson(Map<String, dynamic> json) => _$Dht11FromJson(json);

  Map<String, dynamic> toJson() => _$Dht11ToJson(this);
}