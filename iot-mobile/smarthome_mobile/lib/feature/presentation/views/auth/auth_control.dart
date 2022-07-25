import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/user.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/auth_repository_impl.dart';
import 'package:smarthome_mobile/feature/data/shared_preferences/authentication_storage.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/main_screen.dart';
import 'package:smarthome_mobile/feature/presentation/views/report/report_control.dart';

class AuthControl extends GetxController {
  final AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();
  final HomeControl homeControl = Get.find();
  final ReportControl reportControl = Get.find();

  static late User _user;

  static User get instance => _user;

  @override
  void onInit() {
    _user = User();
    super.onInit();
  }

  bool _isCanLogin({required String userName, required String pass}) {
    return userName.isEmpty && pass.isEmpty;
  }

  void login({required String userName, required String pass}) async {
    if (_isCanLogin(userName: userName, pass: pass)) {
      return;
    }

    final User user = User(username: userName, password: pass);
    ApiResponse<User>? apiResponse = await authRepositoryImpl.login(user: user);
    if (apiResponse != null) {
      _user = apiResponse.result!.data!;
      homeControl.getDataSensor();
      reportControl.getDataSensor();
      Get.to(MainScreen());
    }
  }

  Future<bool> autoLogin() async {
    LoginInfo? loginInfo = await _authenticationStorage.getLoginInfo();
    print(loginInfo.toString());
    if (loginInfo != null) {
      ApiResponse<User>? apiResponse =
          await authRepositoryImpl.login(user: User.fakeUser);
      User? user = apiResponse?.result?.data;
      if (user != null) {
        _user = user;
        return true;
      }
    }
    return false;
  }
}
