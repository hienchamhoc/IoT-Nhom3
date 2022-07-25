import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/core/constant/string_const.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/settings/settings.dart';
import 'package:smarthome_mobile/feature/presentation/views/settings/settings_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/report/report.dart';
import 'package:smarthome_mobile/feature/presentation/views/report/report_control.dart';

class BottomIcon extends StatelessWidget {
  final Icon? icon;
  final String? label;

  BottomIcon({
    Key? key,
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon ?? const SizedBox.shrink(),
        label != null ? Text(label!) : const SizedBox.shrink(),
      ],
    );
  }
}

class MainScreen extends StatelessWidget {
  final HomeControl homeControl = Get.find();
  final ReportControl reportControl = Get.find();
  List<Widget> _children() {
    List<Widget> list = [
      HomeScreen(),
      ReportScreen(),
      SettingsScreen(),
    ];

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: _children(),
        ),
      ),
    );
  }

  Widget menu() {
    return const TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black87,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.blue,
      tabs: [
        Tab(
          icon: Icon(Icons.bar_chart),
          text: StringConst.report,
        ),
        Tab(
          icon: Icon(Icons.home),
          text: StringConst.home,
        ),
        Tab(
          icon: Icon(Icons.settings),
          text: StringConst.settings,
        ),
      ],
    );
  }
}
