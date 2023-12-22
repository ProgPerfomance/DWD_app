import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';

class SendMessage extends ChangeNotifier {
  Dio dio = Dio();
  Future<void> sendMessage({
    required cid,
    required uid,
    required msg,
  }) async {
    final response = await dio.post('${ServerRoutes.host}/sendmessage', data: {
      'cid': cid.toString(),
      'uid': uid.toString(),
      'msg': msg.toString(),
    });
  }
}
