import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/domain/get_user_cars.dart';
import 'package:untitled1/domain/sell_car_request.dart';
import 'package:untitled1/view/servise/select_car_booking_view.dart';
import '../profile/create_car_view.dart';

TextEditingController _userNameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNubmerController = TextEditingController();

bool gcc = false;
bool noAccident = false;
bool fullServiceHistory = false;

class ConsignmentView extends GetView<GetUserCars> {
  const ConsignmentView({super.key});

  @override
  Widget build(BuildContext context) {

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
                              cid: controller.sellCarId.value,
                              owner_name: _userNameController.text,
                              owner_email: _emailController.text,
                              owner_phone: _phoneNubmerController.text,
                              gcc: gcc,
                              servise_history: fullServiceHistory,
                              any_car_accidents: noAccident);
                          gcc =false;
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

class CheckBoxWidget extends StatefulWidget {
  final String text;
  int variable;
  var _variable = false;
  CheckBoxWidget({super.key, required this.text, required this.variable});
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
              switch(widget.variable) {
                case 0:
                  gcc = !gcc;
                 widget._variable = gcc;
                case 1:
                  noAccident = !noAccident;
                  widget._variable = noAccident;
                case 2:
                  fullServiceHistory = !fullServiceHistory;
                  widget._variable = fullServiceHistory;
              }
              setState(() {});
            },
            child: widget._variable == false
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
