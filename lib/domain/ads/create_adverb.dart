import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/ads_model.dart';

class CreateAdverb extends ChangeNotifier {
  Dio dio = Dio();
  Future<void> createAdverb(AdverbModel adverbModel) async {
    final response = await dio.post('${ServerRoutes.host}/createadverb',
    data: {
      'uid': adverbModel.uid.toString(),
      'size': adverbModel.size.toString(),
      'price': adverbModel.price.toString(),
      'phone': adverbModel.phone.toString(),
      'hp': adverbModel.hp.toString(),
      'messages': adverbModel.messages.toString(),
      'year': adverbModel.year,
    }
    );
  }
}


//     required  ,
//     required  category,
//     required  uid,
//     required  year,
//     required  sex,
//     required  age,
//     required  color,
//     required  timestamp,
//     required  description,
//     required  address,
//     required  model,
//     required  brand,
//     required  engine,
//     required  state,
//     required  build_type,
//     required  category_id,
//     required  cpu,
//     required  drive_type,
//     required  engine_cylinders,
//     required  engine_volume,
//     required  flour,
//     required  fuel_supply,
//     required  gears,
//     required  gpu,
//     required  killometrs,
//     required  memory_hard,
//     required  nm,
//     required  order_type,
//     required  ram,
//     required  repair,
//     required  rights,
//     required  screen_size,
//     required  square,
//     required  tact_numbers,
//     required  transmission ,
//     required  type,