import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smarthome_mobile/core/constant/string_const.dart';
import 'package:smarthome_mobile/feature/presentation/common_widget/on_off_icon.dart';
import 'package:smarthome_mobile/feature/presentation/views/home/home_control.dart';
import 'package:smarthome_mobile/feature/presentation/views/settings/settings_control.dart';
import 'package:sprintf/sprintf.dart';

class HomeScreen extends StatelessWidget {
  final HomeControl homeControl = Get.find();
  final SettingsControl settingsControl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Center(child: Text("Home")),
      ),
      body: Center(
        child: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 8, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(() {
                    return Text(
                      settingsControl.isAutoUpdate.value
                          ? 'Trạng thái: tự động cập nhật'
                          : 'Trạng thái: tạm dừng cập nhật',
                      style: TextStyle(fontSize: 17),
                    );
                  }),
                ),
              ),
              Text(
                '${homeControl.operation.value.data?.temperature}°C',
                style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
              ),
              Text(
                sprintf('${StringConst.humidity}: %s%',
                    ['${homeControl.operation.value.data?.humidity}']),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.green.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.lightbulb_outline),
                    title: Text('Living room'),
                    trailing: Obx(() => OnOffIcon(
                          state: homeControl.livingRoom.value.data?.state,
                          onTap: (isOn) {
                            homeControl.changeStateLivingRoom();
                            homeControl.getDataSensor();
                          },
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.green.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.lightbulb_outline),
                    title: Text("bath room"),
                    trailing: Obx(
                      () => OnOffIcon(
                        state: homeControl.bedRoom.value.data?.state,
                        onTap: (isOn) {
                          homeControl.changeStateBedRoom();
                          homeControl.getDataSensor();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
// class HomeScreen extends StatelessWidget {
//   final int? numOfRoom;
//   HomeScreen({Key? key, this.numOfRoom,}) : super(key: key);
//
//   final ConfigData configData = ConfigData();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Text(sprintf(StringConst.using, ['5']), style: TextStyle(
//                 fontSize: 25
//             ),),
//             SizedBox(
//               height: 100,
//             ),
//             DynamicTreeView(
//               width: MediaQuery.of(context).size.width,
//               listData: configData.getData(),
//               onTap: (map) {
//                 print(map);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
