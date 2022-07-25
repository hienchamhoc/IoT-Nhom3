import 'package:smarthome_mobile/configs/api_config.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/user.dart';
import 'package:smarthome_mobile/feature/data/domain/repositories/auth_repository.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_result.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/rest_client.dart';
import 'package:smarthome_mobile/feature/data/shared_preferences/authentication_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient restClient = RestClient();
  final AuthenticationStorage authenticationStorage = AuthenticationStorage();

  @override
  Future<ApiResponse<User>>? login({required User user}) async {
    try {
      var response = await restClient.postMethod(ApiConfig.login, data: user.toJson());
      String token = response.data['data']['token'];
      authenticationStorage.updateToken(token);
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
            json: json,
            rootName: '',
            jsonConverter: (json) => User.fromJson(json)),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

  @override
  Future<ApiResponse<User>>? signUp({required user}) async {
    try {
      var response = await restClient.postMethod(ApiConfig.signup, data: user.toJson());
      String token = response.data['token'];
      print('token: $token');
      authenticationStorage.updateToken(token);
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
            json: json,
            rootName: '',
            jsonConverter: (json) => User.fromJson(json)),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }

}