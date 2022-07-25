import 'package:smarthome_mobile/core/util/extensions/tree_view.dart';

class ConfigData {
  late final List<List<int>>? rooms;
  late final List<List<String>>? names;
  ConfigData({List<List<int>>? rooms, List<List<String>>? names}) {
   this.rooms = rooms ?? [];
   this.names = names ?? [];
  }

  List<BaseData> getData() {
    List<BaseData> datas = [];
    BaseData rootBase = BaseData(id: '0', name: 'Root', parentId: '-1',);
    datas = [rootBase,];
    datas.insertAll(0, _livingRoom());
    datas.insertAll(0, _kitchen());
    return datas;
  }

  List<BaseData> _livingRoom() {
    BaseData rootLivingRoom = BaseData(id: '1', parentId: '0', name: 'living room');
    List<BaseData> datas = [rootLivingRoom,];
    var element = [
      BaseData(id: '1.1', parentId: '1', name: 'first'),
      BaseData(id: '1.2', parentId: '1', name: 'second'),
      BaseData(id: '1.3', parentId: '1', name: 'third'),
    ];
    datas.insertAll(0, element);
    return datas;
  }

  List<BaseData> _kitchen() {
    BaseData rootKitchen = BaseData(id: '2', parentId: '0', name: 'kitchen');
    List<BaseData> datas = [rootKitchen,];
    var element = [
      BaseData(id: '2.1', parentId: '2', name: 'first'),
      BaseData(id: '2.2', parentId: '2', name: 'second'),
      BaseData(id: '2.3', parentId: '2', name: 'third'),
    ];
    datas.insertAll(0, element);
    return datas;
  }
}