// ignore_for_file: invalid_use_of_protected_member


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/car_controller.dart';
import 'package:untitled1/meneger_view/manager_add_car/manager_edit_car.dart';

import '../master_view/booking_master_view.dart';
import '../server_routes.dart';

class MenegerCarPageView extends GetView<CarController> {
  final String name;
  final String id;
  final String brand;
  final String model;
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
  final String ccid;
  final String description;
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
      required this.id,
        required this.description,
        required this.brand,
        required this.model,
      required this.ccid});

  @override
  Widget build(BuildContext context) {
    Get.put(CarController());
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.getCarInfo(id);
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: 244,
                child: PageView(
                  children: List.generate(controller.images.value, (index) {
                    return Image.network(
                      '${ServerRoutes.host}/get_photo?path=$ccid&ind=${index + 1}',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    );
                  }),
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
                    // TextCascadeWidget(
                    //     field: 'Steering wheel:',
                    //     parametr: steeringWheel.toString()),
                    TextCascadeWidget(
                        field: 'Motors Trim:', parametr: motorsTrim.toString()),
                    TextCascadeWidget(
                        field: 'Body:', parametr: body.toString()),
                    // TextCascadeWidget(
                    //     field: 'State:', parametr: state.toString()),
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
                     Text(
                    description,  style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ManagerEditCar(id: id,color: color, model: model, brand: brand, year: year, description: description, body: body, motorTrim: motorsTrim, regionalSpecs: regionalSpecs, miliage: kilometrs, priceAED: price_aed, priceUSD: price_usd, qurantee: guarantee, transmission: transmission, sericeContact: serviceContract)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff363636),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/manager_edit_purple.svg',
                            color: Colors.white,),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              'Change',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    GestureDetector(
                      onTap: (){
                        controller.deleteCar(id.toString());
                        Navigator.pop(context);
                        showDialog<void>(
                            useSafeArea: false,
                            context: context,
                            barrierDismissible:
                            false, // user must tap button!
                            builder: (BuildContext context) {
                              return const MyCustomAlert(text: 'Car deleted');
                            });
                        controller.getCarList();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 32,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff363636),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/delete.svg',
                            color: Colors.white,),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
