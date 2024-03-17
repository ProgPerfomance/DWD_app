// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/master/booking_master_controller.dart';
import 'package:untitled1/master_view/master_profile.dart';
import 'package:untitled1/meneger_view/manager_booking/manager_open_booking.dart';
import 'package:untitled1/meneger_view/meneger_profile_view.dart';

class BookingManagerView extends GetView<MasterBookingController> {
  const BookingManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MasterBookingController());
    controller.getManagerBookingList();
    controller.getManagerNewBookingList();
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(
          backgroundColor: const Color(0xff121212),
          centerTitle: true,
          title: const Text(
            'Booking',
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
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getManagerBookingList();
                    controller.newManagerBooking(false);
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2.57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: controller.newList.value == false
                          ? const Color(0xff8874ff)
                          : const Color(0xff363636),
                    ),
                    child: const Center(
                      child: Text(
                        'ALL REQUEST',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    controller.newManagerBooking(true);
                    controller.getNewMasterBookingList();
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2.57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: controller.newList.value == true
                          ? const Color(0xff8874ff)
                          : const Color(0xff363636),
                    ),
                    child: Center(
                      child: Text(
                        controller.newBooking.value > 0
                            ? 'NEW (${controller.newBooking.value})'
                            : 'NEW',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 199,
              child: ListView(
                children: List.generate(
                    controller.newList.value == false
                        ? controller.bookingList.value.length
                        : controller.managerNewBookingList.value.length,
                    (index) {
                  var item = controller.newList.value == false
                      ? controller.bookingList.value[index]
                      : controller.managerNewBookingList.value[index];
                  String date = item['date_time'].toString().substring(0, 10);
                  String time = item['date_time'];
                  if (int.parse(time.substring(11, 13)) < 13) {
                    time = item['date_time'];
                    time =
                        '${time.substring(11, 13)}:${time.substring(11, 13)} AM';
                  } else {
                    time =
                        '${int.parse(time.substring(11, 13)) - 12}:${int.parse(time.substring(11, 13))} PM';
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     ManagerOpenBooking(
                                       userEmail: item['owner_email'],
                                      userName: item['owner_name'],
                                      userPhone: item['owner_phone'],
                                      description: item['description'],
                                      carName: item['car_name'],
                                       delivery: item['delivery'],
                                       pickUp: item['pickup'],
                                       id: item['id'],
                                       garage: item['garage'],
                                       status: item['status'],
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff363636),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 154,
                                      height: 55.3,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/booking_time.svg'),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  time,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xffffffff)
                                                            .withOpacity(0.87),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 3.8,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/booking_date.svg'),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  date,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        const Color(0xffffffff)
                                                            .withOpacity(0.87),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 24,
                                    width: 77,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: item['status'] == 'Pending'
                                          ? const Color(0xffFA0E0E)
                                          : item['status'] == 'Approved'
                                              ? const Color(0xff40CC46)
                                              : const Color(0xff8875FF),
                                    ),
                                    child: Center(
                                      child: Text(
                                        item['status'],
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/manager_service.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            item['garage_name'] == ""? item['service_name'] :  item['garage_name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: item['garage_name'] == ""
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/master_person.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            item['owner_name'],
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
                                          SvgPicture.asset(
                                              'assets/icons/master_description.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            item['description'].toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
