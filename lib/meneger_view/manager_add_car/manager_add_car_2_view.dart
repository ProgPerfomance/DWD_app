import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/transmission_model.dart';
import 'manager_add_car_3_view.dart';
final _modelContoller =TextEditingController();
final _priceController = TextEditingController();
final _colorController = TextEditingController();
final _miliegeController = TextEditingController();
final _regionalSpecsController = TextEditingController();
final _transmissionController = TextEditingController();
final _motorRimController = TextEditingController();
final _bodyController = TextEditingController();
final _stateController = TextEditingController();
final _guranteeController = TextEditingController();
final _serviceContactController = TextEditingController();

class ManagerAddCar2View extends StatefulWidget {
  final List images;
  const ManagerAddCar2View({super.key, required this.images});

  @override
  State<ManagerAddCar2View> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<ManagerAddCar2View> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SafeArea(
          child: ListView(
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
                      'Car page',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
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
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('2/3 Car info',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),),
              ),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(children: [
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Model",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                              title: Text(
                                _modelContoller.text,
                                style: const TextStyle(color: Colors.white),
                              ),
                              expandedCrossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: List.generate(
                                  cars.length,
                                      (index) => GestureDetector(
                                    onTap: () {
                                      _modelContoller.text = cars[index];
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(4.0),
                                          child: Text(cars[index],style: const TextStyle(  color: Colors.white,),),
                                        ),
                                      ],
                                    ),
                                  )),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Price",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.only(start: 10)),
                              controller: _priceController,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Color",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.only(start: 10)),
                              controller: _colorController,

                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Mileage",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.only(start: 10)),
                              controller: _miliegeController,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Regional Specs",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.only(start: 10)),
                              controller: _regionalSpecsController,
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Transmission",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionTile(
                              title: Text(
                                _transmissionController.text,
                                style: const TextStyle(color: Colors.white),
                              ),
                              children: List.generate(
                                  transmissions.length,
                                      (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                      _transmissionController.text = transmissions[index];
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(transmissions[index],style: const TextStyle(  color: Colors.white,),),
                                        ),
                                      ],
                                    ),
                                  )),
                            )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Motors Trim",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsetsDirectional.only(start: 10)),
                                controller: _motorRimController,
                               )),
                      ),
                    ]),
                    Column(children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Body",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: const Color(0x00212121),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding:
                                  EdgeInsetsDirectional.only(start: 10)),
                              controller: _bodyController,
                            )),
                      ),
                    ]),
                    Column(children: [
                      Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Guarantee",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: const Color(0x00212121),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsetsDirectional.only(
                                          start: 10)),
                                  controller: _guranteeController,
                               )),
                        ),
                        Column(children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Service contract",
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: const Color(0x00212121),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextField(
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding:
                                        EdgeInsetsDirectional.only(
                                            start: 10)),
                                    controller: _serviceContactController,
                                   )),
                          ),
                        ])
                      ])
                    ]),
                  ])),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:  GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ManagerAddCar3View()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      color: const Color(0xff8875FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}