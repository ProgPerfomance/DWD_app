import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/master/booking_master_controller.dart';

import 'manager_booking_select_garage.dart';

class ManagerOpenBooking extends GetView<MasterBookingController> {
  final String? carName;
  final String? userName;
  final String? userPhone;
  final String? userEmail;
  final String? description;
  final String? pickUp;
  final String? delivery;
  final id;
  final status;
  final garage;
  const ManagerOpenBooking({
    super.key,
    required this.carName,
    required this.description,
    required this.userEmail,
    required this.userName,
    required this.userPhone,
    required this.delivery,
    required this.pickUp,
    required this.id,
    required this.garage,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MasterBookingController());
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        title: const Text(
          'Booking',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Client Details',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/car.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    carName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/person.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    userName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/phone.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    userPhone.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/email.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    userEmail.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SvgPicture.asset(
                'assets/icons/master_description.svg',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                description.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                pickUp == null || pickUp == ''
                    ? 'Pickup From: -'
                    : 'Pickup From: $pickUp',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                delivery == null || delivery == ''
                    ? 'Delivery To: -'
                    : 'Delivery To: $delivery',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/manager_service.svg',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ManagerSelectGarage()));
                    },
                    child: Obx(
                      () => Text(
                        controller.garage['title'] ?? 'Select garage',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: controller.garage['title'] == null
                              ? Colors.red
                              : const Color(0xff8875FF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              garage == null && status == 'Pending'
                  ? GestureDetector(
                      onTap: () {
                        controller.setGarage(
                            id: id, garage: controller.garage['id']);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff8875FF),
                        ),
                        child: const Center(
                          child: Text(
                            'Send to garage',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              status == 'Pending'
                  ? GestureDetector(
                      onTap: () {
                        controller.cancelBooking(id: id);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff363636),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
} //manager_service
