import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthUser extends ChangeNotifier {
  var uid;
  Dio dio = Dio();
  Future<int> authUser({
    required email_or_phone,
    required password_hash,
  }) async {
    final response = await dio.post('http://63.251.122.116:2308/auth', data: {
      'email_or_phone': email_or_phone,
      'password_hash': password_hash,
    });
    print(response.data);
    uid = response.data.toString();
    return int.parse(response.data.toString());
  }

  Future createUser({
    required name,
    required phone,
    required email,
    required password_hash,
  }) async {
    dio.post('http://63.251.122.116:2308/reguser', data: {
      'name': 'name',
      'password_hash': 'password',
      'phone': 'phone',
      'email': 'email',
    });
  }
}
