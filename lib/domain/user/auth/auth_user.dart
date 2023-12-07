import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';

class AuthUserFromEmail extends ChangeNotifier {
  Dio dio = Dio();
  Future<dynamic> authUserFromEmail(String email, String password)  async {
    final response = await dio.post('${ServerRoutes.host}/authuser',
    data: {
      'email': email,
      'password': password,
    });
    var data = await jsonDecode(response.data);
    if(data['success'] == true) {
      print(data['uid']);
      return data['uid'];
    }
    return null;
  }
}