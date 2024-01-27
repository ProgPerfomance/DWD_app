import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  RxList bookingList = [].obs;
  Dio dio = Dio();
  Future<void> getUserBooking() async {
    final response = await dio.post('http://63.251.122.116:2308/getuserbooking',
    data: {'uid': '1'});
    print(response.data);
    bookingList.value = jsonDecode(response.data);
    bookingList.refresh();
    notifyChildrens();
  }
}