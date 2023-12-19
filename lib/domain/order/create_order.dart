import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../ServerRoutes.dart';

class CreateOrder extends ChangeNotifier {
  Future<void> createOrder({
    required int uid,
    required String name,
    required String timestamp,
    required String category,
    required String category_sup,
    required String date_and_time,
    required double geo_x,
    required double geo_y,
    required double geo_del_x,
    required double geo_del_y,
    required int price_min,
    required int price_max,
    required String wishes,
    required String img1,
    required String img2,
    required String img3,
    required String img4,
    required String img5,
    required String img6,
    required String img7,
    required String img8,
    required String img9,
    required String img10,
    required String username,
    required String order_status,
    required String email,
    required String city,
    required bool remotely,
}) async {
    Dio dio = Dio();
    final response = await dio.post('${ServerRoutes.host}/createorder', data:
   {
      'uid': uid,
     'name': name,
     'timestamp': timestamp,
     'category': category,
     'category_sup': category_sup,
     'date_and_time': date_and_time,
     'geo_x': geo_x,
     'geo_y': geo_y,
     'geo_del_x': geo_del_x,
     'geo_del_y': geo_del_y,
     'price_min': price_min,
     'price_max': price_max,
     'wishes': wishes,
     'username': username,
     'order_status': order_status,
     'email': email,
     'city': city,
     'remotely': remotely,
      });

  }
}