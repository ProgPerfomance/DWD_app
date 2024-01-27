import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetCarList extends GetxController {
  Dio dio = Dio();
  RxList cars = [].obs;
  Future<void> getCarList() async {
    final response =
        await dio.post('http://63.251.122.116:2308/getcars', data: {
      'id': '1',
    });
    print(response.data);
    log(response.data.toString());
    cars.value = jsonDecode(response.data);
    notifyChildrens();
    cars.refresh();
    notifyChildrens();
  }

  Future<void> likeCar(pid) async {
    dio.post('http://63.251.122.116:2308/likecar', data: {
      'uid': '1',
      'cid': pid,
    });
    getCarList();
  }

  Future<void> dislikeCar(id) async {
    dio.post('http://63.251.122.116:2308/dislikecar', data: {
      'id': id,
    });
    getCarList();
  }
}
