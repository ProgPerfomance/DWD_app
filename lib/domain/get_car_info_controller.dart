import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetCarInfoController extends GetxController {
  Dio dio = Dio();
  RxInt images = 0.obs;
  Future<void> getCarInfo(String id) async {
    final response =
        await dio.post('http://63.251.122.116:2308/getcarinfo', data: {
      'id': id.toString(),
    });
    var data = jsonDecode(response.data);
    images.value = data['images'];
    notifyChildrens();
  }
}
