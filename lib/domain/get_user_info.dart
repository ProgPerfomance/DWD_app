import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
   Dio dio = Dio();
   RxMap user = {}.obs;
  Future<void> getUserInfo(uid) async {
    final response = await dio.post('http://63.251.122.116:2308/getuserinfo',
    data: {'uid': uid.toString()});
    user.value = jsonDecode(response.data);
  }
}