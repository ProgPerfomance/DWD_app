import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/server_routes.dart';

UserModel? userModel;

class AuthController extends GetxController {
  Dio dio = Dio();
  Future<UserModel> authUser({
    required email_or_phone,
    required password_hash,
  }) async {
    final response = await dio.post('${ServerRoutes.host}/auth', data: {
      'email_or_phone': email_or_phone,
      'password_hash': password_hash,
    });
    final data = await jsonDecode(response.data);
    if (data['success'] == true) {
      userModel = await UserModel(
          email: data['email'],
          phone: data['phone'],
          cid: data['cid'],
          uid: data['uid'],
          name: data['name'],
          managerPhone: data['manager_phone'],
          rules: int.parse(data['rules']));
      print(userModel);
      FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
      flutterSecureStorage.write(key: 'uid', value: data['uid'].toString());
      return userModel!;
    }
    return UserModel(
      email: '',
      phone: '',
      cid: 0,
      uid: 0,
      name: '',
      rules: -1,
      managerPhone: data['manager_phone'],
    );
  }

  Future createUser({
    required name,
    required phone,
    required email,
    required password_hash,
    required rules,
  }) async {
    final response = await dio.post('${ServerRoutes.host}/reguser', data: {
      'name': name.toString(),
      'password_hash': password_hash.toString(),
      'phone': phone.toString(),
      'email': email.toString(),
      'rules': rules.toString(),
    });
    final data = jsonDecode(response.data);
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    flutterSecureStorage.write(key: 'uid', value: data['uid'].toString());
    userModel = UserModel(
      email: data['email'],
      phone: data['phone'],
      cid: null,
      uid: data['uid'],
      name: name,
      rules: data['rules'],
      managerPhone: data['manager_phone'],
    );
    ChatController()
        .createChat(uid1: data['uid'], uid2: 0, cid: -1, type: 'support');
  }
}
