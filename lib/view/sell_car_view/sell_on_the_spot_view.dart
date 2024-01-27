import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/get_user_cars.dart';

import '../profile/create_car_view.dart';
import '../servise/select_car_booking_view.dart';
import 'consignment_view.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNubmerController = TextEditingController();

class SellOnTheSpotView extends GetView<GetUserCars> {
  const SellOnTheSpotView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetUserCars());
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      'Sell on the spot',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xfffffffff)),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Owner name',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CreateCarField(
                      text: 'Owner name',
                      controller: userNameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Mobile number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CreateCarField(
                      text: 'Mobile number',
                      controller: phoneNubmerController,
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
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/sell_car_purple.svg',
                          width: 24,
                          height: 24,
                          color: const Color(0xff8875FF),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectCarBookingView(
                                            sell: true)));
                          },
                          child: Obx(
                            () => Text(
                              controller.carSell.value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff8687E7)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    const CheckBoxWidget(text: 'Any car accidents'),
                    const SizedBox(
                      height: 16,
                    ),
                    const CheckBoxWidget(text: 'GCC'),
                    const SizedBox(
                      height: 16,
                    ),
                    const CheckBoxWidget(text: 'Any car accidents'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff8875FF),
                          ),
                          child: const Center(
                            child: Text(
                              'Send',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
