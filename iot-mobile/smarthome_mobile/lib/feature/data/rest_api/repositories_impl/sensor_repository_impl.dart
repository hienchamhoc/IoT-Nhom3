import 'dart:math';

import 'package:smarthome_mobile/configs/api_config.dart';
import 'package:smarthome_mobile/feature/data/domain/entities/sensor.dart';
import 'package:smarthome_mobile/feature/data/domain/repositories/sensor_repository.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_response.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/models/api_result.dart';
import 'package:smarthome_mobile/feature/data/rest_api/datasources/rest_client.dart';

class SensorRepositoryImpl implements SensorRepository {
  final RestClient restClient = RestClient();

  @override
  Future<ApiResponse<Sensor>> getDataSensor() async {
    try {
      var res = await restClient.getMethod(ApiConfig.sensorRoute, params: {});
      //var res = TestSensor.randomSensor();
      //print('res: $res');
      return ApiResponse.withResult2(
        response: res.data,
        resultConverter: (json) => ApiResultSingle<Sensor>(
          json: json,
          rootName: '',
          jsonConverter: (json) => Sensor.fromJson(json),
        ),
      );
    } catch (error) {
      return ApiResponse.withError(error);
    }
  }
}

class TestSensor {
  static Map<String, dynamic> randomSensor() {
    final Random random = Random();
    int index = random.nextInt(2);
    return listSensor[index];
  }
  static const List<Map<String, dynamic>> listSensor = [fakeSensor, fakeSensor2];
  static const Map<String, dynamic> fakeSensor = {
    "data": [
      {
        "data": {
          "status": 0
        },
        "name": "Living Room Light"
      },
      {
        "data": {
          "status": 1
        },
        "name": "Bed Room Light"
      },
      {
        "data": {
          "temperature": "29",
          "humidity": "59"
        },
        "name": "dht11"
      },
      {
        "data": [
          {
            "time": "17-7",
            "led1": 0,
            "led2": 0
          },
          {
            "time": "18-7",
            "led1": 0,
            "led2": 0
          },
          {
            "time": "19-7",
            "led1": 0,
            "led2": 0
          },
          {
            "time": "20-7",
            "led1": 9546.5,
            "led2": 0
          },
          {
            "time": "21-7",
            "led1": 845.5,
            "led2": 263
          },
          {
            "time": "22-7",
            "led1": 485,
            "led2": 125
          },
          {
            "time": "23-7",
            "led1": 120,
            "led2": 65
          }
        ],
        "name": "weeklyLightsUsedTime"
      }
    ]
  };
  static const Map<String, dynamic> fakeSensor2 = {
    "data": [
      {
        "data": {
          "status": 1
        },
        "name": "Living Room Light"
      },
      {
        "data": {
          "status": 0
        },
        "name": "Bed Room Light"
      },
      {
        "data": {
          "temperature": "24",
          "humidity": "65"
        },
        "name": "dht11"
      },
      {
        "data": [
          {
            "time": "17-7",
            "led1": 4351,
            "led2": 1234
          },
          {
            "time": "18-7",
            "led1": 0,
            "led2": 0
          },
          {
            "time": "19-7",
            "led1": 0,
            "led2": 0
          },
          {
            "time": "20-7",
            "led1": 9546.5,
            "led2": 0
          },
          {
            "time": "21-7",
            "led1": 845.5,
            "led2": 263
          },
          {
            "time": "22-7",
            "led1": 485,
            "led2": 125
          },
          {
            "time": "23-7",
            "led1": 120,
            "led2": 65
          }
        ],
        "name": "weeklyLightsUsedTime"
      }
    ]
  };
}