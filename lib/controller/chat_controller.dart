import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class ChatController extends GetxController {
  Dio dio = Dio();
  RxList chats = [].obs;
  RxList messages = [].obs;
  Future<void> getChats(uid) async {
    final response = await dio.post('${ServerRoutes.host}/getchats', data: {
      'uid': uid.toString(),
    });
    chats.value = jsonDecode(response.data);
    notifyChildrens();
  }

  Future<int> createChat(
      {required uid1, required uid2, required cid, required type}) async {
    final response = await dio.post('${ServerRoutes.host}/createchat', data: {
      'uid1': uid1.toString(),
      'uid2': uid2.toString(),
      'cid': cid.toString(),
      'type': type.toString(),
    });
    return jsonDecode(response.data);
  }

  Future<void> getChatMessages(cid) async {
    final response = await dio.post('${ServerRoutes.host}/getMessages',
        data: {'cid': cid.toString()});
    messages.clear();
    messages.value = jsonDecode(response.data);
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
    await dio.post('${ServerRoutes.host}/sendMessage', data: {
      'cid': cid.toString(),
      'uid': uid.toString(),
      'msg': msg.toString(),
    });
    Future.delayed(const Duration(milliseconds: 30), () {
      getChatMessages(cid);
      notifyChildrens();
    });
  }
}
