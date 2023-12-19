import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/ServerRoutes.dart';
import 'package:untitled1/model/user_model.dart';

class GetUserProfile extends ChangeNotifier {
  UserModel? userModel;
  Dio dio = Dio();

  Future getUserProfile(int id) async {
    final response = await dio.get('${ServerRoutes.host}/getuserdata', data: {
      'id': id,
    });
    print(response.data);
    final data = jsonDecode(response.data);
    print(data['name']);
    userModel = UserModel(
        email: data['email'],
        city: data['city'],
        password_hash: data['password_hash'],
        name: data['name'],
        email_succes: data['email_succes'],
        rating: data['rating'],
        servises: data['servises'],
        client_visiting: data['client_visiting'],
        about_me: data['about_me'],
        experience: data['experience'],
        education: data['education'],
        spheres: data['spheres'],
        freelancer: data['freelancer'],
        skills: data['skills'],
        avatar: data['avatar'],
        date_of_burn: data['date_of_burn'],
        country: data['country'],
        age: data['age'],
        last_login: data['last_login'],
        reviews: data['reviews']);
    print(userModel!.name);
  }


  Future<UserModel> getOtherUserProfile(int id) async {
    final response = await dio.get('${ServerRoutes.host}/getuserdata', data: {
      'id': id,
    });
    print(response.data);
    final data = jsonDecode(response.data);
    print(data['name']);
    print(data);
    return UserModel(
        email: data['email'],
        city: data['city'],
        password_hash: null,
        name: data['name'],
        email_succes: data['email_succes'],
        rating: data['rating'],
        servises: data['servises'],
        client_visiting: data['client_visiting'],
        about_me: data['about_me'],
        experience: data['experience'],
        education: data['education'],
        spheres: data['spheres'],
        freelancer: data['freelancer'],
        skills: data['skills'],
        avatar: data['avatar'],
        date_of_burn: data['date_of_burn'],
        country: data['country'],
        age: data['age'],
        last_login: data['last_login'],
        reviews: data['reviews']);


}}