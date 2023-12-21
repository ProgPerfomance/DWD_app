import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/get_chat_model.dart';

class GetUserChats extends ChangeNotifier {
  Dio dio = Dio();
  List<GetChatModel> chats = [];
  Future<void> getUserChats(uid) async {

    final response = await dio.post('${ServerRoutes.host}/getchats',
    data: {
      'uid': uid.toString(),
    });
    chats.clear();
    print(response.data);
  List data = jsonDecode(response.data);
  for(int i =0; i < data.length; i++) {
    chats.add(GetChatModel(avatar: '', cid: data[i]['cid'], last_message: data[i]['last_message'], subject_id: data[i]['subject_id'], subject_name: data[i]['subject_name'], uid_opponent: data[i]['uid_opponent'], oponent_name: data[i]['opponent_name'].toString(), ));
  }
notifyListeners();

  }
}