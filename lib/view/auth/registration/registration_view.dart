
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controller/chat_controller.dart';

import '../../../domain/auth_user_domain.dart';
import '../../home_view.dart';
import '../login/login_view.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailContoller = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegistrationView extends GetView<AuthController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                const Center(
                  child: Text(
                    'Create account',
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                TextField(
                  style: const TextStyle(
                    color: Color(0xffffffff),
                  ),
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Name',
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
                    color: Color(0xffffffff),
                  ),
                  inputFormatters: [
                    MaskedInputFormatter('+### (##) ###-##-##')
                  ],
                  controller: _phoneController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Mobile number',
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
                    color: Color(0xffffffff),
                  ),
                  controller: _emailContoller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Email',
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
                    color: Color(0xffffffff),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.3,
                ),
                GestureDetector(
                  onTap: () {
                    if(_emailContoller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email field is empty'),
                        ),
                      );}
                      else if(_passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password field is empty'),
                        ),
                      );
                    }
                    else if(_nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Name field is empty'),
                        ),
                      );
                    }
                    else if(_phoneController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Phone field is empty'),
                        ),
                      );
                    }
                    else {
                      controller.createUser(
                        password_hash: _passwordController.text,
                        phone: _phoneController.text,
                        email: _emailContoller.text,
                        name: _nameController.text,
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
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
                        'Create account',
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
                      'Already have an account?',
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
                                builder: (context) => const LoginView()),
                            (route) => false);
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: const Color(0xffffffff).withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
