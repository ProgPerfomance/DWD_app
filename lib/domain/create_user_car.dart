import 'package:dio/dio.dart';
import 'package:untitled1/domain/auth_user_domain.dart';


  Dio dio = Dio();
  Future<void> createUserCar({
    required name,
    required brand,
    required model,
    required year,
    required car_reg,
}) async {
    await dio.post('http://63.251.122.116:2308/createusercar',
      data: {
      'uid': userModel!.uid,
        'name': name.toString(),
        'brand': brand.toString(),
        'model': model.toString(),
        'year': year.toString(),
        'car_reg': car_reg.toString()
      }
    );
  }
