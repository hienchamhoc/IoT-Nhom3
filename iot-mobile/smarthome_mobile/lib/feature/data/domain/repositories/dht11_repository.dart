import 'package:smarthome_mobile/feature/data/domain/entities/dht11.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';

abstract class Dht11Repository {
  Future<ApiResponse<Dht11>>? saveTempAndHumi();
}