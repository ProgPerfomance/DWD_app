import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_user_car.dart';
import 'package:untitled1/view/profile/car_list_view.dart';

import '../../controller/get_user_info.dart';
import '../../master_view/booking_master_view.dart';

TextEditingController _name = TextEditingController();
TextEditingController _brand = TextEditingController();
TextEditingController _model = TextEditingController();
TextEditingController _year = TextEditingController();
TextEditingController _carReg = TextEditingController();

class CreateCarView extends StatefulWidget {
  const CreateCarView({super.key});

  @override
  State<CreateCarView> createState() => _CreateCarViewState();
}

class _CreateCarViewState extends State<CreateCarView> {
  @override
  Widget build(BuildContext context) {
    final translate = Get.put(UserInfoController()).translateModel.value;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:  Text(
                        translate.back,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff8875FF),
                          ),
                        ),
                      ),
                       Text(
                       translate.MY_CARS,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: GestureDetector(
                          onTap: () {
                            createUserCar(
                                name: _name.text,
                                brand: _brand.text,
                                model: _model.text,
                                year: _year.text,
                                car_reg: _carReg.text);
                            _carReg.clear();
                            _name.clear();
                            _year.clear();
                            _model.clear();
                            _brand.clear();
                          Navigator.pop(context);
                            showDialog<void>(
                                useSafeArea: false,
                                context: context,
                                barrierDismissible:
                                false, // user must tap button!
                                builder: (BuildContext context) {
                                  return const MyCustomAlert(text: 'Car created!');
                                });
                          },
                          child:  Text(
                            translate.send,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff7A7A7A), //0xff7A7A7A
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                       translate.newCar,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                       Text(
                     translate.carName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: translate.giveCarName,
                        controller: _name,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Text(
                     translate.brand,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                            controller: _brand,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff1D1D1D),
                          hintStyle: const TextStyle(
                            color: Color(
                              0xff535353,
                            ),
                          ),
                          hintText: translate.brand,
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff7A7A7A), width: 1),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            borderSide: const BorderSide(
                                color: Color(0xff7A7A7A), width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Text(
                       translate.model,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: translate.model,
                        controller: _model,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Text(
                        translate.year,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: translate.year,
                        controller: _year,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                       Text(
                       translate.carReg,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: translate.carReg,
                        controller: _carReg,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateCarField extends StatelessWidget {
  final text;
  final controller;
  const CreateCarField(
      {super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff1D1D1D),
        hintStyle: const TextStyle(
          color: Color(
            0xff535353,
          ),
        ),
        hintText: text,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff7A7A7A), width: 1),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(color: Color(0xff7A7A7A), width: 1),
        ),
      ),
    );
  }
}
