import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';

class CreateUser extends ChangeNotifier {
  Dio dio = Dio();
  Future<void> createUser({
    required var name,
    required var email,
    required var age,
    required var freelancer,
    required var last_login,
    required var password_hash,
    required var city,
    required var country,
    required var date_of_burn,
    required var avatar,
    required var spheres,
    required var skills,
    required var education,
    required var experience,
    required var about_me,
    required var client_visiting,
    required var servises,
    required var rating,
    required var reviews,
    required var email_succes,
  }) async {
    final reponse = await dio.post('${ServerRoutes.host}/createuser', data: {
      'name': name,
      'email': email,
      'age': age,
      'first_name': freelancer,
      'city': city,
      'last_login': last_login,
      'skills': skills,
      'avatar': avatar,
      'date_of_burn': date_of_burn,
      'spheres': spheres,
      'password_hash': password_hash,
      'country': country,
      'education': education,
      'experience': experience,
      'about_me': about_me,
      'client_visiting': client_visiting,
      'servises': servises,
      'rating': rating,
      'reviews': email_succes,
    });
  }
}
