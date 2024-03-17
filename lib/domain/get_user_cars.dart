import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

class GetUserCars extends GetxController {
  RxString car = 'Select car'.obs;
  RxString carSell = 'Select car'.obs;
  RxString carId = ''.obs;
  RxString sellCarId = ''.obs;
  void changeCarName(newCar,cid) {
    car.value = newCar;
    carId.value= cid;
    carId.refresh();
    car.refresh();
    notifyChildrens();
  }
  void changeSellCarName(newCar, cid) {
    carSell.value = newCar;
    sellCarId.value = cid;
    carSell.refresh();
    notifyChildrens();
  }
  Dio dio = Dio();
  RxList userCars = [].obs;
  Future<void> getUserCars() async {
    final response = await dio.post('http://63.251.122.116:2308/getusercars',
    data: {
      'uid': userModel!.uid.toString(),
    });
    userCars.value = jsonDecode(response.data);
    userCars.refresh();
    notifyChildrens();
  }
}