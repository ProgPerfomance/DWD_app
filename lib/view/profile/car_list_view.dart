// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/delete_user_car.dart';
import 'package:untitled1/domain/get_user_cars.dart';
import 'package:untitled1/view/profile/update_car_view.dart';

import '../../controller/get_user_info.dart';
import 'create_car_view.dart';

class CarListView extends GetView<GetUserCars> {
  const CarListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetUserCars());
    controller.getUserCars();
    final translate = Get.put(UserInfoController()).translateModel.value;
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
                        child:  Text(translate.back,style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff7A7A7A),
                        ),),
                      ),
                       Text(translate.MY_CARS,style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateCarView()));
                        },
                        child:  Text(translate.add,style: const TextStyle(
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
                      return Column(
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
                            Row(
                              children: [
                                GestureDetector(onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateCarView(
                                   id: item['id'],
                                   model: item['model'],
                                   brand: item['brand'],
                                   year: item['year'],
                                   car_reg: item['car_reg'],
                                   name: item['name'],
                                 )));
                                },child: SvgPicture.asset('assets/icons/edit.svg',width: 24, height: 24,)),
                                const SizedBox(width: 8,),
                                GestureDetector(onTap: () {
                                  deleteUserCar(item['id']);
                                 Future.delayed(const Duration(seconds: 1),() {
                                   controller.getUserCars();
                                 });
                                },
                                  child: SvgPicture.asset('assets/icons/delete.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 32,),
                        Container(height: 0.3,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffffffff).withOpacity(0.3),)
                      ],
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
