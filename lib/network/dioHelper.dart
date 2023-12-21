import 'dart:io';

import 'package:untitled1/const/net_const.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static  Dio dio= Dio();

  void init() {
    //super.init();
    Dio dio = Dio(BaseOptions(
      baseUrl: NetStrings.baseUrl,
      contentType: "application/json",
      headers: {"accept": "application/json"},
      receiveDataWhenStatusError: true,
    ));
    dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true, request: true, requestHeader: true, error: true, responseHeader: true));

  }
}