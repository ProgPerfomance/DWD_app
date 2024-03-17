import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/services_controller.dart';

import '../../view/profile/create_car_view.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class AddGarageView extends GetView<ServicesController> {
  const AddGarageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'Create garage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xff121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(
              height: 16,
            ),
            CreateCarField(
              text: 'Name',
              controller: _nameController,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Email',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(
              height: 16,
            ),
            CreateCarField(
              text: 'Email',
              controller: _emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Phone',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(
              height: 16,
            ),
            CreateCarField(
              text: 'Phone',
              controller: _phoneController,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xffffffff)),
            ),
            const SizedBox(
              height: 16,
            ),
            CreateCarField(
              text: 'Password',
              controller: _passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                controller.createGarage(
                    name: _nameController.text,
                    phone: _phoneController.text,
                    email: _emailController.text,
                    passwordHash: _passwordController.text);
                _nameController.clear();
                _passwordController.clear();
                _phoneController.clear();
                _emailController.clear();
                Navigator.pop(context);
              },
              child: Container(
                height: 52,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff8875FF),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
