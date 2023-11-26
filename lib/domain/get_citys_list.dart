import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GetCitysList extends ChangeNotifier {
  var allCityList = [];
  var popularCityList = [];
  var selectedCity = 'Москва';
  Dio dio = Dio();
  Future<void> getAllCitys() async {
    if(allCityList.length < 2) {
      final response = await dio.get(
          'http://192.168.88.14:2302/getallcitylist');
      final json = jsonDecode(response.data);
      allCityList = json['citys'];
      print(allCityList);
      notifyListeners();
    }
  }
  Future<void> getPopularCitys() async {
    if(popularCityList.length < 2) {
      final response = await dio.get(
          'http://192.168.88.14:2302/popularallcitylist');
      final json = jsonDecode(response.data);
      popularCityList = json['citys'];
      print(popularCityList);
      notifyListeners();
    }
  }
  void selectCity(String city) {
    selectedCity = city;
    notifyListeners();
  }
}