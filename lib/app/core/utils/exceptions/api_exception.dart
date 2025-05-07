// coverage:ignore-file

import 'package:dio/dio.dart';

String extractErrorMessage(DioException error) {
  if (error.response != null && error.response!.data['message'] != null) {
    return error.response!.data['message'].toString();
  } else {
    return error.message ?? 'Dio error';
  }
}
