import 'package:smarthome_mobile/configs/api_config.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/light.dart';
import 'package:smarthome_mobile/feature/data/domain/repositories/light_repository.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_result.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/rest_client.dart';

class LightRepositoryImpl implements LightRepository {
  final RestClient restClient = RestClient();

  @override
  Future<ApiResponse<Light>>? createLight({required Light light}) async {
    try {
      var res = await restClient.postMethod(ApiConfig.lightRoute, data: light.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => Light.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Light>>? removeLight({required Light light}) async {
    try {
      var res = await restClient.deleteMethod(ApiConfig.lightRoute, params: light.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => Light.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Light>>? searchLight({required Light light}) async {
    try {
      var res = await restClient.getMethod(ApiConfig.lightRoute, params: light.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => Light.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<Light>>? updateLight({required Light light}) async {
    try {
      var res = await restClient.putMethod(ApiConfig.lightRoute, data: light.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => Light.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
