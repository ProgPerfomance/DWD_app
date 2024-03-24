import 'package:dio/dio.dart';
import 'package:untitled1/server_routes.dart';

Future<void> sellCarRequest({
  required var uid,
  required int type,
  required var cid,
  required var owner_name,
  required var owner_email,
  required var owner_phone,
  required var gcc,
  required var servise_history,
  required var any_car_accidents,
}) async {
  Dio dio = Dio();
  dio.post('${ServerRoutes.host}/sellcarrequest',
  data: {'uid': uid,
    'cid': cid,
    'type': type.toString(),
    'owner_name': owner_name,
    'owner_phone': owner_phone,
    'owner_email': owner_email,
    'gcc': gcc,
    'servise_history': servise_history,
    'any_car_accidents': any_car_accidents,
  });
}