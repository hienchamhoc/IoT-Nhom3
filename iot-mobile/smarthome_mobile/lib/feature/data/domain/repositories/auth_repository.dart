import 'package:smarthome_mobile/feature/data/domain/entities/user.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse<User>>? signUp({required User user});

  Future<ApiResponse<User>>? login({required User user});

}
