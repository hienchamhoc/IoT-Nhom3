import 'package:smarthome_mobile/configs/api_config.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/light.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/light_operations.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/domain/repositories/light_operation_repository.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_result.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/rest_client.dart';

class LightOperationImpl implements LightOperationRepository {
  final RestClient restClient = RestClient();

  @override
  Future<ApiResponse<LightOperation>>? createLightOperations({required DataRoom dataRoom}) async {
    try {
      final LightDto lightDto = LightDto(
        name: dataRoom.name,
        data: StatusLight(status: !dataRoom.data!.state),
      );
      var res = await restClient.postMethod(ApiConfig.lightOperations, data: lightDto.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => LightOperation.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<LightOperation>>? searchLightOperations({required LightOperation lightOperation}) async {
    try {
      var res = await restClient.getMethod(ApiConfig.lightRoute, params: lightOperation.toJson());
      return ApiResponse.withResult(
        response: res.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => LightOperation.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

}