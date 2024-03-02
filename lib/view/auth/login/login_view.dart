// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/master_view/master_home.dart';
import 'package:untitled1/meneger_view/meneger_home_view.dart';
import '../../../domain/auth_user_domain.dart';
import '../../home_view.dart';
import '../forgot_password_view.dart';
import '../registration/registration_view.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    'Welcome back to DWD!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffff).withOpacity(0.8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Mobile number or Email',
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Password',
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordView()),
                              (route) => false);
                        },
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 3.3),
                GestureDetector(
                  onTap: () async {
                    var check = await controller.authUser(
                      password_hash: _passwordController.text,
                      email_or_phone: _emailController.text,
                    );
                    if (check.rules != -1) {
                      switch(check.rules) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeView()));
                        case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MenegerHomeView()));
                          print('manager');
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MasterHomeView()));
                          print('master');
                      }
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Неверный логин или пароль'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      color: const Color(0xff8875FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xff979797),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationView()),
                            (route) => false);
                      },
                      child: Text(
                        ' Create one',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: const Color(0xffffffff).withOpacity(0.8)),
                      ),
                    ),
                    //     Image.file(File('assets/design/images/support.png'),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//EyeClosed
