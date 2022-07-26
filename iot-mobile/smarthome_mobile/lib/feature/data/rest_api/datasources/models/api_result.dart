import 'metadata.dart';

abstract class ApiResult<T> {
  T? _data;

  ApiResult();

  T? get data => _data;
}

//khi dữ liệu API trả về dang list
class ApiResultList<T> extends ApiResult<List<T>> {
  Metadata? _metadata;

  ApiResultList({
    required Map<String, dynamic> json,
    required String rootName,
    required T Function(dynamic json) jsonConverter,
  }) {
    if (json.containsKey('metadata')) {
      _metadata = Metadata.fromJson(json['metadata']);
    }
    if (!json.containsKey(rootName)) return;
    var dataJson = json[rootName];
    if (dataJson is List) {
      _data = dataJson.map(jsonConverter).toList();
    }
  }
}

//khi dữ liệu API trả về là 1 phần từ
class ApiResultSingle<T> extends ApiResult<T> {
  ApiResultSingle({
    required Map<String, dynamic> json,
    required String rootName,
    required T Function(dynamic json) jsonConverter,
  }) {
    if (!json.containsKey(rootName)) {
      var dataJson = json;
      _data = jsonConverter(dataJson);
      return;
    }
    var dataJson = json[rootName];
    _data = jsonConverter(dataJson);
  }
}
