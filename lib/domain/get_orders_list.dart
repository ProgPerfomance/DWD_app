import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';

class GetOrdersList extends ChangeNotifier {
  List orders = [];
  List myOrders = [];
  Dio dio = Dio();
  Future<void> getAllOrders() async {
    final response = await dio.get('${ServerRoutes.host}/getorders');
    final json = jsonDecode(response.data);
    orders = json['orders'];
    print('ddd');
}
  Future<void> getMyOrders() async {
    final response = await dio.get('${ServerRoutes.host}/getmyorders');
    final json = jsonDecode(response.data);
    myOrders = json['orders'];
    print('ddd');
  }
}