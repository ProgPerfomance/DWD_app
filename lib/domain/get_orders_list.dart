import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/order_model.dart';

class GetOrdersList extends ChangeNotifier {
  List<OrderModel> orders = [];
  List myOrders = [];
  Dio dio = Dio();
  Future<void> getAllOrders() async {
    final response = await dio.get('${ServerRoutes.host}/getorders');
    List json = jsonDecode(response.data);
    orders.clear();
    for(int i = 0; i < json.length; i++) {
      var data = json[i];
      orders.add(OrderModel(uid: data['uid'], remotely: data['remotely'], email: data['email'], username: data['username'], wishes: data['wishes'], price_max: data['price_max'], price_min: data['price_min'], category: data['category'], name: data['name'], id: data['id'], orderStatus: data['order_status'], sees: data['sees'], city: data['city']));
    }
   // print(json);
  //  print(orders);
}
  Future<void> getMyOrders() async {
    final response = await dio.get('${ServerRoutes.host}/getmyorders');
    final json = jsonDecode(response.data);

  }
}