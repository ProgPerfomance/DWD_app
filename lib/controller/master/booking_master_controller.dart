import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/server_routes.dart';
import 'package:untitled1/view/booking/booking_list_view.dart';

class MasterBookingController extends ChangeNotifier {
  RxList bookingList = [].obs;
  RxBool newList = true.obs;
  RxList managerNewBookingList = [].obs;
  RxList masterNewBookingList = [].obs;
  RxInt newBooking = 0.obs;
  RxMap garage = {}.obs;
  Dio dio = Dio();
  Future<void> getMasterBookingList() async {
    final response =
        await dio.post('${ServerRoutes.host}/getmasterbooking', data: {
      'cid': userModel!.uid.toString(),
    });
    bookingList.value = jsonDecode(response.data);
    notifyListeners();
  }

  Future<void> getNewMasterBookingList() async {
    final response =
        await dio.post('${ServerRoutes.host}/getnewmasterbooking', data: {
      'cid': userModel!.uid.toString(),
    });
    masterNewBookingList.value = await jsonDecode(response.data);
    newBooking.value = masterNewBookingList.length;
    notifyListeners();
  }

  Future<void> getManagerBookingList() async {
    final response = await dio.get(
      '${ServerRoutes.host}/getmanagerbooking',
    );
    bookingList.value = await jsonDecode(response.data);
    newBooking.value = managerNewBookingList.length;
    notifyListeners();
  }

  Future<void> getManagerNewBookingList() async {
    final response = await dio.get(
      '${ServerRoutes.host}/getManagerNewBooking',
    );
    managerNewBookingList.value = await jsonDecode(response.data);
    newBooking.value = managerNewBookingList.length;
    print('manager booking ${response.data}');
    notifyListeners();
  }

  Future<void> acceptBooking({required id}) async {
    dio.post('${ServerRoutes.host}/updatebooking', data: {
      'id': id.toString(),
      'status': 'Approved',
      'reason': '',
    });
  }

  Future<void> cancelBooking({required id, required String reason}) async {
    dio.post('${ServerRoutes.host}/updatebooking', data: {
      'id': id.toString(),
      'status': 'Canceled',
      'reason': reason,
    });
  }
  Future<void> cancelBookingMaster({required id, required String reason}) async {
    dio.post('${ServerRoutes.host}/updatebooking', data: {
      'id': id.toString(),
      'status': 'Pending',
      'reason': reason,
      'garage': null.toString(),
    });
  }
  void newManagerBooking(value) {
    newList.value = value;
    notifyListeners();
  }
  void selectGarage(value) {
    garage.value = value;
    notifyListeners();
  }
  Future<void> setGarage({required id, required garage}) async{
    await dio.post('${ServerRoutes.host}/setBookingGarage',
    data: {
      'id': id,
      'garage': garage,
    });

  }
}
