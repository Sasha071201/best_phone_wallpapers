import 'package:dio/dio.dart';

class ApiClientException extends DioError {
  ApiClientException({
    required super.requestOptions,
    required super.type,
    super.response,
    super.error,
  });

  String asString() {
    switch (type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.response:
        return 'No network, check connection';
      case DioErrorType.cancel:
        return '';
      case DioErrorType.other:
        return 'An unknown error has occurred, please try again later';
    }
  }
}
