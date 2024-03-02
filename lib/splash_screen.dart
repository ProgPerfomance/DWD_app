//ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/view/onboarding/onboarding_1_view.dart';

import 'master_view/master_home.dart';
import 'meneger_view/meneger_home_view.dart';
import 'view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 10),() async {
     FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
     String? uid =  ((await flutterSecureStorage.read(key: 'uid')) != null ? await flutterSecureStorage.read(key: 'uid') : '')!;
      if(uid != '') {
        Dio dio = Dio();
      var response = await dio.post('http://63.251.122.116:2308/getuserinfo',
        data: {'uid': int.parse(uid)});
      final data = await jsonDecode(response.data);
      userModel = await UserModel(email: data['email'], phone: data['phone'], cid: data['cid'], uid: int.parse(uid), name: data['name'], rules: data['rules']);
        switch(data['rules']) {
          case '0':
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeView()));
          case '3':
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MenegerHomeView()));
            print('manager');
          case '1':
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const MasterHomeView()));
            print('master');
        }
      }
      else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Onboarding1View()));
      }
    });
    return Scaffold(

    );
  }
}
