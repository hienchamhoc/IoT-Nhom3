import 'package:smarthome_mobile/feature/data/domain/entities/light.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';

abstract class LightRepository {
  Future<ApiResponse<Light>>? createLight({required Light light});
  Future<ApiResponse<Light>>? removeLight({required Light light});
  Future<ApiResponse<Light>>? updateLight({required Light light});
  Future<ApiResponse<Light>>? searchLight({required Light light});
}