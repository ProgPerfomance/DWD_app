import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetUserCars extends GetxController {
  RxString car = 'Select car'.obs;
  RxString carSell = 'Select car'.obs;
  void changeCarName(newCar) {
    car.value = newCar;
    car.refresh();
    notifyChildrens();
  }
  void changeSellCarName(newCar) {
    carSell.value = newCar;
    carSell.refresh();
    notifyChildrens();
  }
  Dio dio = Dio();
  RxList userCars = [].obs;
  Future<void> getUserCars() async {
    final response = await dio.post('http://63.251.122.116:2308/getusercars',
    data: {
      'uid': '1',
    });
    print(response.data);
    userCars.value = jsonDecode(response.data);
    userCars.refresh();
    notifyChildrens();
  }
}