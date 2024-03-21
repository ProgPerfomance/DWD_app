import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/server_routes.dart';

class BookingController extends GetxController {
  RxList bookingList = [].obs;
  Dio dio = Dio();
  Future<void> getUserBooking() async {
    final response = await dio.post('${ServerRoutes.host}/getuserbooking',
    data: {'uid': userModel!.uid.toString()});
    print(response.data);
    bookingList.value = jsonDecode(response.data);
    bookingList.refresh();
    notifyChildrens();
  }
  Future<void> cancelBooking({required id}) async {
    dio.post('${ServerRoutes.host}/updatebooking',
        data: {
          'id': id.toString(),
          'status': 'Canceled',
        });
  }
}