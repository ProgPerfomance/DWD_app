import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/message_model.dart';

class GetChatMessages extends ChangeNotifier {
  Dio dio = Dio();
  List<MessageModel> messages = [];
  Future<void> getChatMessages(cid) async {

    final response = await dio.post('${ServerRoutes.host}/getmessages',
    data: {'cid': cid.toString()});
    print(response.data);
    messages.clear();
    List msgs = jsonDecode(response.data);
    for(int i =0; i < msgs.length; i++) {
      messages.add(MessageModel(uid: msgs[i]['uid'], pid: msgs[i]['pid'], msg_text: msgs[i]['msg_text']));
    }
    notifyListeners();
   }
   void clearList() {
    messages.clear();
    notifyListeners();
   }
}