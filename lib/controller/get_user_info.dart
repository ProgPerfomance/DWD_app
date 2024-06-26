import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';
import 'package:untitled1/translate/eng_model.dart';

import '../translate/ru_model.dart';
import '../translate/translate_model.dart';

class UserInfoController extends GetxController {
  Dio dio = Dio();
  RxMap user = {}.obs;
  Future<void> getUserInfo(uid) async {
    final response = await dio.post('${ServerRoutes.host}/getuserinfo',
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
  Future<void> changePhone(phone) async {
    await dio.post('${ServerRoutes.host}/updateManagerNumber', data: {
      'phone': phone.toString(),
    });}
  Rx<TranslateModel> translateModel = engModel.obs;
  void changeLaunguage(lang) {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
   if(lang == ruModel) {flutterSecureStorage.write(key: 'locale', value: '1');}
   else {
     flutterSecureStorage.write(key: 'locale', value: '0');
   }
    translateModel.value = lang;
    translateModel.refresh();
    notifyChildrens();
  }
  Future<void> changePhoto() async {
  }
}
