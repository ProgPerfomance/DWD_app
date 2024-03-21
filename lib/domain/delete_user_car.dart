import 'package:dio/dio.dart';
import 'package:untitled1/server_routes.dart';

Future<void> deleteUserCar(id) async {
  Dio dio = Dio();
  dio.post('${ServerRoutes.host}/deleteusercar', data: {'id': '$id'});

}
