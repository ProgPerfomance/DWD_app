import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../domain/auth_user_domain.dart';
import '../server_routes.dart';

class CarController extends GetxController {
  Dio dio = Dio();

  Future<void> deleteCar(id) async {
    dio.post("${ServerRoutes.host}/deleteCar", data: {
      'id': id,
    });
  }

  RxList cars = [].obs;
  RxList wishList = [].obs;

  Future<void> getCarList() async {
    final response =
        await dio.post('${ServerRoutes.host}/getcars', data: {
      'id': userModel!.uid.toString(),
    });
    cars.value = jsonDecode(response.data);

    notifyChildrens();
    cars.refresh();
    notifyChildrens();
  }

  Future<void> getWishlist() async {
    final response =
        await dio.post('${ServerRoutes.host}/getWishlist', data: {
      'uid': userModel!.uid.toString(),
    });
    wishList.value = jsonDecode(response.data);

    notifyChildrens();
    wishList.refresh();
    notifyChildrens();
  }

  Future<void> likeCar(pid, uid) async {
     await dio.post('${ServerRoutes.host}/likecar', data: {
      'uid': userModel!.uid.toString(),
      'cid': pid.toString(),
    });
    Future.delayed(const Duration(milliseconds: 35), () {
      getCarList();
      getCarInfo(pid);
      notifyChildrens();
    });
  }

  Future<void> dislikeCar(id, carId) async {
    dio.post('${ServerRoutes.host}/dislikecar', data: {
      'id': id.toString(),
    });
    Future.delayed(const Duration(milliseconds: 35), () {
      getCarList();
      getWishlist();
      getCarInfo(carId);
      notifyChildrens();
    });
  }
  RxInt images = 0.obs;
  Rx likeId = ''.obs;
  Rx liker = '0'.obs;
  Future<void> getCarInfo(String id) async {
    final response =
    await dio.post('${ServerRoutes.host}/getcarinfo', data: {
      'id': id.toString(),
      'uid': userModel!.uid.toString(),
    });
    var data = jsonDecode(response.data);
    images.value = data['images'];
    liker.value = data['liked'];
    likeId.value = data['like_id'].toString();
    print(response.data);
    print(liker.value);
    notifyChildrens();
  }

}
