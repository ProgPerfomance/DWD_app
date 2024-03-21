import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class SellCarManagerController  extends GetxController {
  RxList<dynamic> carList = [].obs;
  Future<void> getSellCarsList() async {
    Dio dio = Dio();
    final response = await  dio.post('${ServerRoutes.host}/getsellrequests');
    carList.value = jsonDecode(response.data);
    notifyChildrens();
  }
}

