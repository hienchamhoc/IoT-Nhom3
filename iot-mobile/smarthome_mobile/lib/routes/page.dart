import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home.dart';
import 'package:smarthome_mobile/feature/presentation/views/main_screen.dart';
import 'package:smarthome_mobile/feature/presentation/views/splash/splash_screen.dart';
import 'package:smarthome_mobile/routes/routes.dart';

class Pages {
  static final List<GetPage> getPages = [

    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainScreen(),
    ),
  ];
}