import 'package:dio/dio.dart';

Future<void> deleteUserCar(id) async {
  Dio dio = Dio();
  dio.post('http://63.251.122.116:2308/deleteusercar', data: {'id': '$id'});

}
