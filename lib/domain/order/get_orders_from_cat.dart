import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/order_model.dart';

import '../../model/response_from_order_model.dart';

class GetOrdersFromCategory extends ChangeNotifier {
  Dio dio = Dio();
  List<OrderModel> orders = [];
  Future getOrdersFromCategory(category) async {
    final response = await dio.post('${ServerRoutes.host}/getordersfromcat',
    data: {
      'cat': category,
    });
    print(response.data);
    List json = jsonDecode(response.data);
    orders.clear();
    for (int i = 0; i < json.length; i++) {
      var data = json[i];
      orders.add(OrderModel(
          uid: data['uid'],
          remotely: data['remotely'],
          email: data['email'],
          username: data['username'],
          wishes: data['wishes'],
          price_max: data['price_max'],
          price_min: data['price_min'],
          category: data['category'],
          name: data['name'],
          id: data['id'],
          orderStatus: data['order_status'],
          sees: data['sees'],
          city: data['city'],
          responses: []));
    }
    notifyListeners();
  }
  void clearList() {
    orders.clear();
    notifyListeners();
  }
}