import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

import '../translate/ru_model.dart';
import '../translate/translate_model.dart';

class UserInfoController extends GetxController {
  Dio dio = Dio();
  RxMap user = {}.obs;
  Future<void> getUserInfo(uid) async {
    final response = await dio.post('http://63.251.122.116:2308/getuserinfo',
        data: {'uid': uid.toString()});
    user.value = jsonDecode(response.data);
  }

  Future<void> changeName(uid, name) async {
    await dio.post('${ServerRoutes.host}/updateName', data: {
      'name': name,
      'uid': uid,
    });
    Future.delayed(const Duration(milliseconds: 130), () {
      getUserInfo(uid);
    });
    notifyChildrens();
  }
  Rx<TranslateModel> translateModel = ruModel.obs;
  void changeLaunguage(lang) {
    translateModel.value = lang;
    translateModel.refresh();
    notifyChildrens();
  }
}
