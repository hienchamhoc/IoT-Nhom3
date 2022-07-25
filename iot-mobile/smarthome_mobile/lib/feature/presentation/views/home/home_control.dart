import 'package:get/get.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/dht11_repository_impl.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/light_operation_repository_impl.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/light_repository_impl.dart';
import 'package:smarthome_mobile/feature/data/rest_api/repositories_impl/sensor_repository_impl.dart';

class HomeControl extends GetxController {
  final SensorRepositoryImpl sensorRepositoryImpl = SensorRepositoryImpl();
  final LightOperationImpl lightOperationImpl = LightOperationImpl();

  var sensorData = Rx<Sensor>(Sensor());
  var livingRoom = Rx<DataRoom>(DataRoom());
  var bedRoom = Rx<DataRoom>(DataRoom());
  var operation = Rx<Operation>(Operation());

  void getDataSensor() async {
    ApiResponse<Sensor>? apiResponse = await sensorRepositoryImpl.getDataSensor();
    sensorData.value = apiResponse.result!.data!;
     livingRoom.value = sensorData.value.livingRoom;
     bedRoom.value = sensorData.value.bedRoom;
     operation.value = sensorData.value.operation;
  }

  void changeStateLivingRoom() async {
    await lightOperationImpl.createLightOperations(dataRoom: livingRoom.value);
  }

  void changeStateBedRoom() async {
    await lightOperationImpl.createLightOperations(dataRoom: bedRoom.value);
  }
}