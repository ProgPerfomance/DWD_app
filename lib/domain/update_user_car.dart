import 'package:dio/dio.dart';
import 'package:untitled1/server_routes.dart';

updateUserCar({
  required id,
  required name,
  required brand,
  required model,
  required year,
  required car_reg,
} ) async {
  Dio dio = Dio();
  dio.post('${ServerRoutes.host}/updateusercars',
  data: {
    'id': id.toString(),
    'name': name.toString(),
    'brand': brand.toString(),
    'model': model.toString(),
    'year': year.toString(),
    'car_reg': car_reg.toString()
  });
}