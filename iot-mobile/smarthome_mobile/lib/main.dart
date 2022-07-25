import 'package:flutter/material.dart';
import 'package:smarthome_mobile/core/constant/api_const.dart';
import 'package:smarthome_mobile/core/constant/color_const.dart';
import 'package:smarthome_mobile/core/helper/bloc_provider.dart';
import 'package:smarthome_mobile/feature/presentation/global_controllers/user_language_bloc/user_language_bloc.dart';
import 'package:smarthome_mobile/feature/presentation/views/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/routes/page.dart';

void main() {
  APIConst.setBaseUrl(Environment.local); // if you use emulator with local backend, use this line
  // APIConst.setBaseUrl(
  //     Environment.realDevice); // if you use real device, user this line
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RootScreen();
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages.getPages,
      theme: ThemeData(
        //scaffoldBackgroundColor: ColorConst.primaryColorConst.blueShade200,
        appBarTheme: AppBarTheme(
          //color: ColorConst.primaryColorConst.blueShade200,
          elevation: 0,
        ),
      ),
      //routes: RouterLV.pages,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
