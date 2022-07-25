import 'api_error.dart';
import 'api_result.dart';

class ApiResponse<T> {
  String? _status;
  String? _message;
  ApiResult<T>? _result;
  ApiError? _error;

  bool get hasData => _result?.data != null;

  bool get hasError => _error != null;

  bool get isSucceeded => _status != null && _status![1] == '1';

  bool get isFailed => _status == null || _status![0] == '0';

  bool get hasMessage => _message != null;

  ApiResponse();

  factory ApiResponse.withResult({
    Map<String, dynamic>? response,
    ApiResult Function(dynamic json)? resultConverter,
  }) {
    int status = response!['code'];
    if (status == 200) {
      return ApiResponse()
        .._status = status.toString()
        .._result = (resultConverter != null
            ? resultConverter(response['data'])
            : null) as ApiResult<T>?;
    } else {
      return ApiResponse()
        .._status = status.toString()
        .._error = ApiError.fromJson(response);
    }
  }

  factory ApiResponse.withResult2({
    Map<String, dynamic>? response,
    ApiResult Function(dynamic json)? resultConverter,
  }) {
    int status = 200;

    if (response!.containsKey('code')) {
      status = response['code'];
    }

    if (status == 200) {
      return ApiResponse()
        .._status = status.toString()
        .._result = (resultConverter != null
            ? resultConverter(response)
            : null) as ApiResult<T>?;
    } else {
      return ApiResponse()
        .._status = status.toString()
        .._error = ApiError.fromJson(response);
    }
  }

  factory ApiResponse.withError(dynamic error) {
    return ApiResponse()
      .._status = '0'
      .._error = ApiError(error: error);
  }

  factory ApiResponse.catchError({Map<String, dynamic>? response}) {
    return ApiResponse()
      .._status = response!['status'].toString()
      .._error = ApiError.fromJson(response);
  }

  ApiResult<T>? get result => _result;

  ApiError? get error => _error;
}
