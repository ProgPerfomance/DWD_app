import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class MasterBookingController extends ChangeNotifier {
  RxList bookingList = [].obs;
  RxInt newBooking = 0.obs;
  Dio dio = Dio();
  Future<void> getMasterBookingList() async {
    final response = await dio.post('${ServerRoutes.host}/getmasterbooking',
    data: {
      'cid': '1',
    });
    bookingList.value = jsonDecode(response.data);
    notifyListeners();
  }
  Future<void> getNewMasterBookingList() async {
    final response = await dio.post('${ServerRoutes.host}/getnewmasterbooking',
        data: {
          'cid': '1',
        });
    bookingList.value = await jsonDecode(response.data);
    newBooking.value = bookingList.length;
    notifyListeners();
  }
  Future<void> getManagerBookingList() async {
    final response = await dio.post('${ServerRoutes.host}/getmanagerbooking',
        data: {
          'cid': '1',
        });
    bookingList.value = await jsonDecode(response.data);
    newBooking.value = bookingList.length;
    notifyListeners();
  }
  Future<void> acceptBooking({required id}) async {
    dio.post('${ServerRoutes.host}/updatebooking',
    data: {
      'id': id.toString(),
      'status': 'Approved',
    });
  }
  Future<void> cancelBooking({required id}) async {
    dio.post('${ServerRoutes.host}/updatebooking',
        data: {
          'id': id.toString(),
          'status': 'Canceled',
        });
  }
}