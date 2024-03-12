import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class ServicesController extends GetxController {
  Dio dio = Dio();
  RxList garages = [].obs;
  Future<void> getGarages() async {
    final response = await dio.get('${ServerRoutes.host}/getGarages');
    print(response.data);
    garages.value = jsonDecode(response.data);
  }
  Future<void> editGarage({required name,required email,required phone,required password,required id}) async {
    await dio.post('${ServerRoutes.host}/editGarage',
    data: {
      'id': id.toString(),
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });
  }
  Future<void> deleteGarage(id) async {
    await dio.post('${ServerRoutes.host}/deleteGarage',
    data: {
      'id': id.toString(),
    });
  }
  Future<void> createGarage({
    required name,
    required phone,
    required email,
    required password_hash,
})  async {
final response = await dio.post('http://63.251.122.116:2308/reguser', data: {
'name': name.toString(),
'password_hash': password_hash.toString(),
'phone': phone.toString(),
'email': email.toString(),
'rules': 1.toString(),
});
}
}