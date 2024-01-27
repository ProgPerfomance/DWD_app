import 'package:dio/dio.dart';

updateUserCar({
  required id,
  required name,
  required brand,
  required model,
  required year,
  required car_reg,
} ) async {
  Dio dio = Dio();
  dio.post('http://63.251.122.116:2308/updateusercars',
  data: {
    'id': id.toString(),
    'name': name.toString(),
    'brand': brand.toString(),
    'model': model.toString(),
    'year': year.toString(),
    'car_reg': car_reg.toString()
  });
}