import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class GetAdsList extends ChangeNotifier {
  Dio dio = Dio();
  Future<void> getAdsList() async {
    final response = await dio.get('');
  }
}