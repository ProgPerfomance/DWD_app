import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/get_user_cars.dart';

import '../../domain/auth_user_domain.dart';
import '../../domain/sell_car_request.dart';
import '../../master_view/booking_master_view.dart';
import '../profile/create_car_view.dart';
import '../servise/select_car_booking_view.dart';
import 'consignment_view.dart';

TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNubmerController = TextEditingController();

class SellOnTheSpotView extends GetView<GetUserCars> {
  const SellOnTheSpotView({super.key});

  @override
  Widget build(BuildContext context) {
    bool gcc = false;
    bool noAccident = false;
    bool fullServiceHistory = false;
    Get.put(GetUserCars());
    _userNameController.text = userModel?.name;
    _emailController.text = userModel?.email;
    _phoneNubmerController.text = userModel?.phone;
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
                          color: Color(0xffffffff)),
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
                      controller: _userNameController,
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
                      controller: _phoneNubmerController,
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
                      controller: _emailController,
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
                    CheckBoxWidget(
                      text: 'GCC',
                      variable: 0,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CheckBoxWidget(
                      text: 'No accident',
                      variable: 1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CheckBoxWidget(
                      text: 'Full service history',
                      variable: 2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          sellCarRequest(
                              uid: userModel!.uid,
                              type: 1,
                              cid: controller.sellCarId.value,
                              owner_name: _userNameController.text,
                              owner_email: _emailController.text,
                              owner_phone: _phoneNubmerController.text,
                              gcc: gcc,
                              servise_history: fullServiceHistory,
                              any_car_accidents: noAccident);
                          gcc =false;
                          Navigator.pop(context);
                          showDialog<void>(
                              useSafeArea: false,
                              context: context,
                              barrierDismissible:
                              false, // user must tap button!
                              builder: (BuildContext context) {
                                return const MyCustomAlert(text: 'Request sent');
                              });
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
