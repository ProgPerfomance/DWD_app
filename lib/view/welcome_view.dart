import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/translate_controller.dart';
import '../controller/get_user_info.dart';
import 'auth/login/login_view.dart';
import 'auth/registration/registration_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = Get.put(UserInfoController()).translateModel.value;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Text(
                translate.welcomeToDWD,
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                translate.welcomeText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xffffffff).withOpacity(0.7)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff8875FF)),
                  child: Center(
                    child: Text(
                      translate.loginTitile,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationView()));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff8875FF)),
                    borderRadius: BorderRadius.circular(8),
                    //  color: const Color(0xff8875FF)
                  ),
                  child: Center(
                    child: Text(
                      translate.createAccount,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
