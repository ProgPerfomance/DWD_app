// ignore_for_file: invalid_use_of_protected_member
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/meneger_view/meneger_car_page_view.dart';
import 'package:untitled1/meneger_view/meneger_profile_view.dart';
import '../../domain/get_cars_list_domain.dart';
import '../view/buy_car/car_page_view.dart';

class MenegerCarCatalogView extends GetView<GetCarList> {
  const MenegerCarCatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCarList());
    controller.getCarList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'DWD',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xffffffff)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MenegerProfileView()),
                  );
                },
                child: Image.asset('assets/testava.png')),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    SvgPicture.asset('assets/manager_add_purple.svg'),
                    const SizedBox(width: 12,),
                    const Text('Add new car',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8875FF),
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              SizedBox(
                height: MediaQuery.of(context).size.height - 437,
                child: Obx(
                  () => GridView.count(
                    primary: false,
                    //   padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 129),
                    children: controller.cars.value.length < 2
                        ? [
                            const CircularProgressIndicator(),
                            const CircularProgressIndicator()
                          ]
                        : List.generate(controller.cars.value.length, (index) {
                            var item = controller.cars.value[index];
                            List<int> img = [];
                            List.generate(item['images'].length, (ind) {
                              img.add(item['images'][ind]);
                            });
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MenegerCarPageView(
                                              liked: item['liked'],
                                              transmission: item['transmission']
                                                  .toString(),
                                              serviceContract:
                                                  item['service_contact'],
                                              name: item['name'].toString(),
                                              price_usd:
                                                  item['price_usd'].toString(),
                                              price_aed:
                                                  item['price_aed'].toString(),
                                              kilometrs: item['killometers']
                                                  .toString(),
                                              year: item['year'].toString(),
                                              body: item['body'].toString(),
                                              state: item['state'].toString(),
                                              motorsTrim:
                                                  item['motor_trim'].toString(),
                                              guarantee:
                                                  item['guarantee'].toString(),
                                              steeringWheel:
                                                  item['steering_whell']
                                                      .toString(),
                                              regionalSpecs:
                                                  item['regional_specs'],
                                              color: item['color'].toString(),
                                              id: item['id'],
                                            )));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.memory(
                                    Uint8List.fromList(img),
                                    height: 130,
                                    fit: BoxFit.fill,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${item['price_aed']} AED '
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item['name'].toString(), // anketss['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    // '${item['year']}, ${item['killometers']}',
                                    '2003, ${item['killometers']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Color(0xff7A7A7A),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
