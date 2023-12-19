import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';

class CreateChat extends ChangeNotifier {
  Dio dio = Dio();
  Future<void> createChat({required uid1, required uid2,required pid}) async {
    final response = await dio.post('${ServerRoutes.host}/createchat',
    data: {
      'uid1': uid1.toString(),
      'uid2': uid2.toString(),
      'chat_subject': pid.toString(),
    });
    print(response.data);
  }
}