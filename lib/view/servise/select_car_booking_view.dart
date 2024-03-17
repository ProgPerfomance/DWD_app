// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/booking_service_controller.dart';
import 'package:untitled1/domain/get_user_cars.dart';
import '../profile/create_car_view.dart';
import 'book_service_view.dart';

class SelectCarBookingView extends GetView<GetUserCars> {
  final bool sell;
  const SelectCarBookingView({super.key, required this.sell});

  @override
  Widget build(BuildContext context) {
    Get.put(GetUserCars());
    controller.getUserCars();
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
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
                        child: const Text('Back',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff7A7A7A),
                        ),),
                      ),
                      const Text('My cars',style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateCarView()));
                        },
                        child: const Text('Add',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff8875FF),
                        ),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 57,),
                Obx(
                      () => Column(
                    children: List.generate(controller.userCars.value.length, (index) {
                      var item = controller.userCars.value[index];
                      return GestureDetector(
                        onTap: () {
                     sell == true ? controller.changeSellCarName(item['name'], item['id'],) : controller.changeCarName(item['name'], item['id']);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 32,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/buy.svg',width: 24,height: 24,),
                                    const SizedBox(width: 16,),
                                    Text(item['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffffffff),
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 32,),
                            Container(height: 0.3,
                              width: MediaQuery.of(context).size.width,
                              color: const Color(0xffffffff).withOpacity(0.3),)
                          ],
                        ),
                      );}),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
