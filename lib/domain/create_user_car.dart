import 'package:dio/dio.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/server_routes.dart';


  Dio dio = Dio();
  Future<void> createUserCar({
    required name,
    required brand,
    required model,
    required year,
    required car_reg,
}) async {
    await dio.post('${ServerRoutes.host}/createusercar',
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
