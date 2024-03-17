import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/home_controller.dart';
import 'package:untitled1/controller/get_user_info.dart';
import 'package:untitled1/view/booking/booking_list_view.dart';
import 'package:untitled1/view/chat/chat_list_view.dart';
import 'package:untitled1/view/sell_car_view/sell_car_view.dart';
import 'package:untitled1/view/servise/servise_view.dart';

import 'buy_car/car_catalog_view.dart';

List screens = [
  const CarCatalogView(),
  const SellCarView(),
  const ServiseView(),
  const ChatListView(),
  const BookingListView(),
];

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final translate = Get.put(UserInfoController()).translateModel.value;
    return Obx(
      ()=> Scaffold(
        body: Stack(
          children: [
            screens[controller.selectedIndex.value],
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff363636).withOpacity(0.93),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                controller.selectIndex(0);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/buy.svg',
                                    height: 24,
                                    width: 24,
                                    color:  controller.selectedIndex.value == 0
                                        ? const Color(0xff8875FF)
                                        : Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.3,
                                  ),
                                  Text(
                                    translate.buy,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: controller.selectedIndex.value == 0
                                          ? const Color(0xff8875FF)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          GestureDetector(
                              onTap: () {
                                controller.selectIndex(1);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/sell.svg',
                                    height: 24,
                                    width: 24,
                                    color: controller.selectedIndex.value  == 1
                                        ? const Color(0xff8875FF)
                                        : Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.3,
                                  ),
                                  Text(
                                    translate.sell,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: controller.selectedIndex.value  == 1
                                          ? const Color(0xff8875FF)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          GestureDetector(
                              onTap: () {
                                controller.selectIndex(2);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/service.svg',
                                    height: 24,
                                    width: 24,
                                    color: controller.selectedIndex.value  == 2
                                        ? const Color(0xff8875FF)
                                        : Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.3,
                                  ),
                                  Text(
                                    translate.service,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: controller.selectedIndex.value  == 2
                                          ? const Color(0xff8875FF)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          GestureDetector(
                              onTap: () {
                                controller.selectIndex(3);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/chat.svg',
                                    height: 24,
                                    width: 24,
                                    color: controller.selectedIndex.value  == 3
                                        ? const Color(0xff8875FF)
                                        : Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5.3,
                                  ),
                                  Text(
                                    translate.chat,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: controller.selectedIndex.value  == 3
                                          ? const Color(0xff8875FF)
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                          GestureDetector(
                            onTap: () {
                             controller.selectIndex(4);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/booking.svg',
                                  height: 24,
                                  width: 24,
                                  color: controller.selectedIndex.value  == 4
                                      ? const Color(0xff8875FF)
                                      : Colors.white,
                                ),
                                const SizedBox(
                                  height: 5.3,
                                ),
                                Text(
                                  translate.booking,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: controller.selectedIndex.value  == 4
                                        ? const Color(0xff8875FF)
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
