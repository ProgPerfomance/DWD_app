import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class ChatController extends GetxController {
  Dio dio = Dio();
  RxList chats = [].obs;
  RxList messages = [].obs;
  Future<void> getChats(uid) async {
    final response = await dio.post('${ServerRoutes.host}/getchats',
    data: {
      'uid': uid.toString(),
    });
    chats.value = jsonDecode(response.data);
    notifyChildrens();
    print(response.data);
    print(uid);
  }
  Future<void> createChat({required uid1, required uid2, required cid}) async {
    dio.post('${ServerRoutes.host}/createchat',
    data: {
      'uid1': uid1.toString(),
      'uid2': uid2.toString(),
      'cid': cid.toString(),
    });
  }
  Future<void> getChatMessages(cid) async {

    final response = await dio.post('${ServerRoutes.host}/getMessages',
        data: {'cid': cid.toString()});
    print(response.data);
    messages.clear();
    messages.value =jsonDecode(response.data);
    notifyChildrens();
  }
  void clearList() {
    messages.clear();
    notifyChildrens();
  }
  Future<void> sendMessage({
    required cid,
    required uid,
    required msg,
  }) async {
    final response = await dio.post('${ServerRoutes.host}/sendMessage', data: {
      'cid': cid.toString(),
      'uid': uid.toString(),
      'msg': msg.toString(),
    });
  }
}