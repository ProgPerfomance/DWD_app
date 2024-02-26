import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SellCarManagerController  extends GetxController {
  RxList<dynamic> carList = [].obs;
  Future<void> getSellCarsList() async {
    Dio dio = Dio();
    final response = await  dio.post('http://63.251.122.116:2308/getsellrequests');
    print(response.data);
    carList.value = jsonDecode(response.data);
    notifyChildrens();
  }
}

