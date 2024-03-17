import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/server_routes.dart';

class ServicesController extends GetxController {
  Dio dio = Dio();
  RxList garages = [].obs;
  RxMap serviceInfo = {}.obs;
  RxList included = [].obs;
  RxList notIncluded = [].obs;
  RxList myOffers = [].obs;
  RxList lastSpecialOffers = [].obs;
  Future<void> getGarages() async {
    final response = await dio.get('${ServerRoutes.host}/getGarages');
    garages.value = jsonDecode(response.data);
  }

  Future<void> editGarage(
      {required name,
      required email,
      required phone,
      required password,
      required id}) async {
    await dio.post('${ServerRoutes.host}/editGarage', data: {
      'id': id.toString(),
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });
  }

  Future<void> deleteGarage(id) async {
    await dio.post('${ServerRoutes.host}/deleteGarage', data: {
      'id': id.toString(),
    });
  }

  Future<void> createGarage({
    required name,
    required phone,
    required email,
    required passwordHash,
  }) async {
        await dio.post('http://63.251.122.116:2308/reguser', data: {
      'name': name.toString(),
      'password_hash': passwordHash.toString(),
      'phone': phone.toString(),
      'email': email.toString(),
      'rules': 1.toString(),
    });
  }
  Future<void> getServiceInfo (id) async {
    final response = await dio.post("${ServerRoutes.host}/getServiceInfo",
    data: {
      'cid': id.toString(),
    });
    serviceInfo.value = jsonDecode(response.data);
    included.value = serviceInfo['included'];
    notIncluded.value = serviceInfo['not_included'];
    serviceInfo.refresh();
    included.refresh();
    notIncluded.refresh();
    notifyChildrens();
  }
  Future<void> createServiceBlock({required title,
  required sid,
  required included}) async {
    dio.post('${ServerRoutes.host}/createServiceBlock',
    data: {
      'title': title.toString(),
      'included': included.toString(),
      'cid': sid.toString(),
    });
    getServiceInfo(sid);
  }
  Future<void> deleteServiceBlock({required id, required sid,
  }) async {
   await dio.post('${ServerRoutes.host}/deleteServiceBlock',
        data: {
          'cid': id,
        });
   getServiceInfo(sid);
  }
  Future<void> createOffer({
    required name,
    required garage,
    required price,
    required lowPrice,
    required description,
}) async {
    dio.post('${ServerRoutes.host}/createOffer',
    data: {
      'name': name,
      'garage': garage,
      'price': price,
      'low_price': lowPrice,
      'description': description,
    });
  }
  Future<void> getMyOffers({
    required garage,
  }) async {
    final response = await dio.post('${ServerRoutes.host}/getMyOffers',
        data: {
          'garage': garage,
        });
    myOffers.value = jsonDecode(response.data);
  }
  Future<void> getLastOffers({
    required garage,
  }) async {
  final response = await  dio.post('${ServerRoutes.host}/getLastOffers',
        data: {
          'garage': garage,
        });
    lastSpecialOffers.value = jsonDecode(response.data);
  }
}
