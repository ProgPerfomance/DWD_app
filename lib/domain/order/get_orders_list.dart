import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/order_model.dart';
import 'package:untitled1/model/response_from_order_model.dart';

class GetOrdersList extends ChangeNotifier {
  List<OrderModel> orders = [];
  List<OrderModel> myOrders = [];
  Dio dio = Dio();
  Future<void> getAllOrders() async {
    final response = await dio.get('${ServerRoutes.host}/getorders');
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
    // print(json);
    //  print(orders);
  }

  Future<void> getMyOrders(int uid) async {
    final response = await dio.get('${ServerRoutes.host}/getmyorders', data: {
      'uid': uid,
    });
    final json = jsonDecode(response.data);
    myOrders.clear();
    for (int i = 0; i < json.length; i++) {
      var data = json[i];
      List responses = data['responses'];
      myOrders.add(OrderModel(
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
          responses: List.generate(
              responses.length,
              (index) => ResponseFromOrderModel(
                  pid: responses[index]['pid'],
                  id: responses[index]['id'],
                  price: responses[index]['price'],
                  uid: responses[index]['uid'],
                  timestamp: responses[index]['timestamp'],
                  date_and_time: responses[index]['date_and_time'],
                  comment: responses[index]['comment']))));
    }
    print(myOrders);
  }
}
