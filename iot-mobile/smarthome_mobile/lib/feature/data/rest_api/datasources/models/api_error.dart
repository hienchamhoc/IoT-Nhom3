import 'package:dio/dio.dart';

class ApiError {
  String? _code;
  String? _message;

  ApiError({dynamic error}) {
    if (error != null) _handleError(error);
  }

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError()
      .._code = json['status'] as String
      .._message = json['message'] as String;
  }

  _handleError(dynamic error) {
    if (error is DioError) {
      _code = error.response?.statusCode.toString() ?? '0';
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          _message = "Connection timeout";
          break;
        default:
          _message = error.response?.data['message'];
          break;
      }
    } else if (error is Error) {
      _message = error.toString();
      print("Exception occured: $error stackTrace: ${error.stackTrace}");
    } else if (error is Exception) {
      _message = error.toString();
      print("Exception occured: $error stackTrace: ${error.toString()}");
    } else {
      _message = "error is unknown";
    }
  }

  String? get code => _code;

  String? get message => _message;
}
