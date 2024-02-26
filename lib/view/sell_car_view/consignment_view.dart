import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/get_user_cars.dart';
import 'package:untitled1/domain/sell_car_request.dart';
import 'package:untitled1/view/servise/select_car_booking_view.dart';
import '../profile/create_car_view.dart';

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneNubmerController = TextEditingController();

class ConsignmentView extends GetView<GetUserCars> {
  const ConsignmentView({super.key});

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
                      'Consignment',
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
                                        SelectCarBookingView(sell: true)));
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
                          sellCarRequest(uid: 1, cid: 2, owner_name: userNameController.text, owner_email: emailController.text, owner_phone: phoneNubmerController.text, gcc: true, servise_history: true, any_car_accidents: true);
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

bool press = false;

class CheckBoxWidget extends StatefulWidget {
  final text;
  const CheckBoxWidget({super.key, required this.text});
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              press = !press;
              setState(() {});
            },
            child: press == false
                ? Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xffffffff),
                      border: Border.all(color: const Color(0xffBDBCDB)),
                    ),
                  )
                : Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xff605DEC),
                      border: Border.all(color: const Color(0xffBDBCDB)),
                    ),
                    child: Center(
                      child: Image.asset('assets/check.png'),
                    ),
                  )),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
