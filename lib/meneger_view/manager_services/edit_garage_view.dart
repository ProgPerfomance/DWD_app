import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/services_controller.dart';

import '../../view/profile/create_car_view.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class EditGarageView extends GetView<ServicesController> {
  final name;
  final phone;
  final email;
  final password;
  final id;
  const EditGarageView({super.key,
  required this.password, required this.phone, required this.email, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    _nameController.text = name;
    _emailController.text = email;
    _passwordController.text = password;
    _phoneController.text = phone;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title:  Text(name,
          style: const TextStyle(
            color: Colors.white,
          ),),
      ),
      backgroundColor: const Color(0xff121212),
      body:  Padding(
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
                controller.editGarage(name: _nameController.text,email: _emailController.text,phone: _phoneController.text,password: _passwordController.text, id: id);
                _nameController.clear();
                _passwordController.clear();
                _phoneController.clear();
                _emailController.clear();
                Navigator.pop(context);
                controller.getGarages();
              },
              child: Container(
                height: 52,
                width: MediaQuery.of(context).size.width-32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff8875FF),
                ),
                child: const Center(
                  child: Text('Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                ),
              ),
            ),
            const SizedBox(height: 24,),
            GestureDetector(
              onTap: () {
                controller.deleteGarage(id);
                Navigator.pop(context);
                controller.getGarages();
              },
              child: Container(
                height: 52,
                width: MediaQuery.of(context).size.width-32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff363636),
                ),
                child: const Center(
                  child: Text('Delete',
                    style: TextStyle(
                    color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
