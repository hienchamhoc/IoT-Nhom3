import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/base_screen.dart';
import 'package:smarthome_mobile/feature/presentation/views/auth/auth.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/settings/settings_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/report/report_control.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HomeControl homeControl = Get.put(HomeControl());
  final ReportControl reportControl = Get.put(ReportControl());
  final SettingsControl settingsControl = Get.put(SettingsControl());

  Future<void> _nextToScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
    Get.to(LoginScreen());
  }

  @override
  void initState() {
    super.initState();
    _nextToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 10,
                    child: const LinearProgressIndicator(),
                  ),
                  const Text("Loading..."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
