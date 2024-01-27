import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_user_car.dart';
import 'package:untitled1/domain/update_user_car.dart';
import 'package:untitled1/view/profile/car_list_view.dart';

import 'create_car_view.dart';

TextEditingController _name = TextEditingController();
TextEditingController _brand = TextEditingController();
TextEditingController _model = TextEditingController();
TextEditingController _year = TextEditingController();
TextEditingController _carReg = TextEditingController();

class UpdateCarView extends StatefulWidget {
  var id;
      var name;
  var brand;
      var model;
  var year;
      var car_reg;
   UpdateCarView({super.key, required this.id,
  required this.name,
  required this.brand,
  required this.model,
  required this.year,
  required this.car_reg,});

  @override
  State<UpdateCarView> createState() => _CreateCarViewState();
}

class _CreateCarViewState extends State<UpdateCarView> {
  @override
  Widget build(BuildContext context) {
    _name.text = widget.name;
    _brand.text = widget.brand;
    _model.text = widget.model;
    _year.text = widget.year;
    _carReg.text = widget.car_reg;
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CarListView()));
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff8875FF),
                          ),
                        ),
                      ),
                      const Text(
                        'My cars',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateCarView()), (route) => false);
                        },
                        child: GestureDetector(
                          onTap: () {
                            updateUserCar(
                              id: widget.id,
                                name: _name.text,
                                brand: _brand.text,
                                model: _model.text,
                                year: _year.text,
                                car_reg: _carReg.text);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
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
                      const Text(
                        'New Car',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Car name',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: 'Give the car name',
                        controller: _name,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Brand',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _brand,
                        style: TextStyle(
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
                          hintText: 'Car Brand',
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
                      const Text(
                        'Model',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: 'Car Model',
                        controller: _model,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Year',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: 'Year',
                        controller: _year,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Car Reg/ Plate Number',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CreateCarField(
                        text: 'Car Reg./ Plate Number',
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
      style: TextStyle(
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
