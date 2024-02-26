import 'package:dio/dio.dart';

Future<void> sellCarRequest({
  required var uid,
  required var cid,
  required var owner_name,
  required var owner_email,
  required var owner_phone,
  required var gcc,
  required var servise_history,
  required var any_car_accidents,
}) async {
  Dio dio = Dio();
  dio.post('http://63.251.122.116:2308/sellcarrequest',
  data: {'uid': uid,
    'cid': cid,
    'owner_name': owner_name,
    'owner_phone': owner_phone,
    'owner_email': owner_email,
    'gcc': gcc,
    'servise_history': servise_history,
    'any_car_accidents': any_car_accidents,
  });
}