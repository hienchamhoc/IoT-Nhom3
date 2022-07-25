import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/report/report_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/settings/settings_control.dart';

class SettingsScreen extends StatelessWidget {
  final HomeControl homeControl = Get.find();
  final ReportControl reportControl = Get.find();
  final SettingsControl settingsControl = Get.find();
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (settingsControl.isAutoUpdate.value) {
        homeControl.getDataSensor();
        reportControl.getDataSensor();
        reportControl.makeShowingBarGroups();
      } else {
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Obx(() {
            if (settingsControl.isAutoUpdate.value) {
              startTimer();
            }
            return ListTile(
              title: Text(settingsControl.isAutoUpdate.value
                  ? 'tự động cập nhật'
                  : 'tạm dừng cập nhật'),
              onTap: () {
                settingsControl.isAutoUpdate.value = !settingsControl.isAutoUpdate.value;
              },
            );
          }),
          const SizedBox(height: 20,),
          ListTile(
            title: Text("LOGOUT"),
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
