import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/sensor_repository_impl.dart';

class ReportControl extends GetxController {
  final SensorRepositoryImpl sensorRepositoryImpl = SensorRepositoryImpl();
  var sensorData = Rx<Sensor>(Sensor());
  RxList<BarChartGroupData> showingBarGroups = RxList();
  DataTimeUsed dataTimeUsed = DataTimeUsed();
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  void getDataSensor() async {
    ApiResponse<Sensor>? apiResponse = await sensorRepositoryImpl.getDataSensor();
    sensorData.value = apiResponse.result!.data!;
    dataTimeUsed = sensorData.value.dataTimeUsed;
  }

  void makeShowingBarGroups() {
    List<BarChartGroupData> items = [];
    final List<TimeUsed> timeUseds = dataTimeUsed.data ?? [];
    for (int i = 0; i < timeUseds.length; i++) {
      items.add(makeGroupData(
          i, (timeUseds[i].led1 ?? 0) , (timeUseds[i].led2 ?? 0)));
    }
    //rawBarGroups = items;

    showingBarGroups.value = items;
    refresh();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        color: rightBarColor,
        width: width,
      ),
    ]);
  }
}