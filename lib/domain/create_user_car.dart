import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/domain/auth_user_domain.dart';


  Dio dio = Dio();
  Future<void> createUserCar({
    required name,
    required brand,
    required model,
    required year,
    required car_reg,
}) async {
    final response = dio.post('http://63.251.122.116:2308/createusercar',
      data: {
      'uid': '1',
        'name': name.toString(),
        'brand': brand.toString(),
        'model': model.toString(),
        'year': year.toString(),
        'car_reg': car_reg.toString()
      }
    );
  }
