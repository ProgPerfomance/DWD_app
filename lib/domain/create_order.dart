import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../ServerRoutes.dart';

class CreateOrder extends ChangeNotifier {
  var address;
  var price;
  var name;
  void setName(n) {
    name = n;
    notifyListeners();
  }
  void setPrice(p) {
  price = p;
  notifyListeners();
  }
  void setAdress(a) {
  address = a;
  notifyListeners();
  }
  Future<void> create() async {
    Dio dio = Dio();
    final response = await dio.post('${ServerRoutes.host}/createorder', data:
   { 'name': name,
      'price': price,
      'address': address,});

  }
}