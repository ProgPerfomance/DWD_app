import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MasterBookingConroller extends ChangeNotifier {
  RxList bookingList = [].obs;
  RxInt newBooking = 0.obs;
  Dio dio = Dio();
  Future<void> getMasterBookingList() async {
    final response = await dio.post('http://63.251.122.116:2308/getmasterbooking',
    data: {
      'cid': '1',
    });
    bookingList.value = jsonDecode(response.data);
    notifyListeners();
  }
  Future<void> getNewMasterBookingList() async {
    final response = await dio.post('http://63.251.122.116:2308/getnewmasterbooking',
        data: {
          'cid': '1',
        });
    bookingList.value = await jsonDecode(response.data);
    newBooking.value = bookingList.value.length;
    notifyListeners();
  }
  Future<void> acceptBooking({required id}) async {
    dio.post('http://63.251.122.116:2308/updatebooking',
    data: {
      'id': id.toString(),
      'status': 'Approved',
    });
  }
  Future<void> cancelBooking({required id}) async {
    dio.post('http://63.251.122.116:2308/updatebooking',
        data: {
          'id': id.toString(),
          'status': 'Canceled',
        });
  }
}