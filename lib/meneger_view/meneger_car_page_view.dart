// ignore_for_file: invalid_use_of_protected_member

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/get_car_info_controller.dart';

class MenegerCarPageView extends GetView<GetCarInfoController> {
  final String name;
  final String id;
  final liked;
  final price_usd;
  final price_aed;
  final String color;
  final kilometrs;
  final String regionalSpecs;
  final String transmission;
  final String steeringWheel;
  final String motorsTrim;
  final String body;
  final String state;
  final String guarantee;
  final String year;
  final String serviceContract;
  const MenegerCarPageView(
      {super.key,
      required this.transmission,
      required this.steeringWheel,
      required this.state,
      required this.serviceContract,
      required this.regionalSpecs,
      required this.motorsTrim,
      required this.kilometrs,
      required this.guarantee,
      required this.color,
      required this.price_aed,
      required this.price_usd,
      required this.body,
      required this.name,
      required this.year,
      required this.liked,
      required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCarInfoController());
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.getCarInfo(id);
    });
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/arrowleft.png')),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffffffff),
                      ),
                    ),
                    SvgPicture.asset('assets/icons/upload.svg'),
                    liked == 'false'
                        ? GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/unlike.svg',
                              height: 24,
                              width: 24,
                              color: Colors.white,
                            ))
                        : GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/icons/like.svg',
                              height: 24,
                              width: 24,
                            )),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 244,
                child: Obx(
                  () => controller.images.value.isEmpty
                      ? const CircularProgressIndicator()
                      : PageView(
                          children: List.generate(
                              controller.images.value.length, (index) {
                            List<int> intList = [];
                            List a = (controller.images.value[index]);
                            List.generate(
                                a.length,
                                (ind) => intList
                                    .add(controller.images.value[index][ind]));
                            return Image.memory(
                              Uint8List.fromList(intList),
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            );
                          }),
                        ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$price_usd \$ / $price_aed AED',
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'cash or finance neg.',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff40CC46),
                            ),
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 - 33,
                            child: const Center(
                              child: Text(
                                'CALL',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffffffff)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xff8875FF),
                            ),
                            height: 60,
                            width: MediaQuery.of(context).size.width / 2 - 33,
                            child: const Center(
                              child: Text(
                                'CHAT',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffffffff)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Car info',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextCascadeWidget(
                        field: 'Color:', parametr: color.toString()),
                    TextCascadeWidget(
                        field: 'Kilometers:', parametr: kilometrs.toString()),
                    TextCascadeWidget(
                        field: 'Regional Specs:',
                        parametr: regionalSpecs.toString()),
                    TextCascadeWidget(
                        field: 'Transmission:',
                        parametr: transmission.toString()),
                    TextCascadeWidget(
                        field: 'Steering wheel:',
                        parametr: steeringWheel.toString()),
                    TextCascadeWidget(
                        field: 'Motors Trim:', parametr: motorsTrim.toString()),
                    TextCascadeWidget(
                        field: 'Body:', parametr: body.toString()),
                    TextCascadeWidget(
                        field: 'State:', parametr: state.toString()),
                    TextCascadeWidget(field: 'Guarantee:', parametr: guarantee),
                    TextCascadeWidget(
                        field: 'Service contract:', parametr: serviceContract),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Almost new, my favorite car!!!!\nPower Windows, Power Locks, Keyless Entry, , Power Seats Air Conditioning, Climate Control, Aux Audio In, Premium Sound System, Power Mirrors, Fog Lights, Premium Wheels/Rims, Performance Tyres, Panoramic, Back DVD, Lane Assistant, Crash Assistant, Blind Spot, Radar, lane assistant, radar assistant, crash assistant, Auto pilot, Auto Park in & Out, Fully Loaded',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(height: 24,),
                    Container(
                      width: MediaQuery.of(context).size.width -32,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff363636),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/manager_edit_purple.svg'),
                          const SizedBox(width: 12,),
                          const Text('Change',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff8875FF),
                            ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]))));
  }
}

class TextCascadeWidget extends StatelessWidget {
  final String field;
  final String parametr;
  const TextCascadeWidget(
      {super.key, required this.field, required this.parametr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.93),
      child: Row(
        children: [
          Text(
            field,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff7A7A7A) //#7A7A7A
                ),
          ),
          const SizedBox(
            width: 5.3,
          ),
          Text(
            parametr,
            style: const TextStyle(color: Color(0xffffffff) //#7A7A7A
                ),
          ),
        ],
      ),
    );
  }
}
