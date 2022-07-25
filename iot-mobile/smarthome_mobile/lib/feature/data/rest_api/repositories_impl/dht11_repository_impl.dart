import 'package:smarthome_mobile/configs/api_config.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/dht11.dart';
import 'package:smarthome_mobile/feature/data/domain/repositories/dht11_repository.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_result.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/rest_client.dart';

class Dht11RepositoryImpl implements Dht11Repository {
  final RestClient restClient = RestClient();

  @override
  Future<ApiResponse<Dht11>>? saveTempAndHumi() async {
    try {
      var response = await restClient.postMethod(ApiConfig.dht11);
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle(
          json: json,
          rootName: '',
          jsonConverter: (json) => Dht11.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}
