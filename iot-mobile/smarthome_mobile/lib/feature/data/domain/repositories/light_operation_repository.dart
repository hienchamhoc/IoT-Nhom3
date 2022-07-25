import 'package:smarthome_mobile/feature/data/domain/entities/light.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/light_operations.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';

abstract class LightOperationRepository {
  Future<ApiResponse<LightOperation>>? createLightOperations({required DataRoom dataRoom});
  Future<ApiResponse<LightOperation>>? searchLightOperations({required LightOperation lightOperation});
}