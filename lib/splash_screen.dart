//ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/get_user_info.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/model/user_model.dart';
import 'package:untitled1/server_routes.dart';
import 'package:untitled1/translate/eng_model.dart';
import 'package:untitled1/translate/ru_model.dart';
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
    final translate = Get.put(UserInfoController());
    Future.delayed(const Duration(milliseconds: 10), () async {
      FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
      String? uid = ((await flutterSecureStorage.read(key: 'uid')) != null
          ? await flutterSecureStorage.read(key: 'uid')
          : '')!;
      if (uid != '') {

        String? locale = ((await flutterSecureStorage.read(key: 'locale')) != null
            ? await flutterSecureStorage.read(key: 'locale')
            : '0')!;
       locale == '0' ? translate.changeLaunguage(engModel) : translate.changeLaunguage(ruModel);
        Dio dio = Dio();
        var response = await dio.post('${ServerRoutes.host}/getuserinfo',
            data: {'uid': uid.toString()});
        if (response.statusCode == 200) {
          final data = await jsonDecode(response.data);
          userModel = await UserModel(
              email: data['email'],
              phone: data['phone'],
              cid: data['cid'],
              uid: int.parse(uid),
              managerPhone: data['manager_phone'],
              name: data['name'],
              rules: data['rules']);
          switch (data['rules']) {
            case '0':
              print(userModel!.managerPhone);
              Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => const HomeView()), (route) => false);
            case '3':
              Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
                  builder: (context) => const MenegerHomeView()), (route) => false);
            case '1':
              Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
                  builder: (context) => const MasterHomeView()), (route) => false);
          }
        } else {
          Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
              builder: (context) => const Onboarding1View()), (route) => false);
        }
      } else {
        Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
            builder: (context) => const Onboarding1View()), (route) => false);
      }
    });
    return Scaffold(
      body: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Onboarding1View()));
        },
        child: const Text('Если не грузит'),
      ),
    );
  }
}
