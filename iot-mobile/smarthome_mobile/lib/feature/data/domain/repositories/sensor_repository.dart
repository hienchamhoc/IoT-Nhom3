import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';

abstract class SensorRepository {
  Future<ApiResponse<Sensor>> getDataSensor();
}