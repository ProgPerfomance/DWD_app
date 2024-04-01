// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/controller/master/booking_master_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/meneger_view/manager_booking/manager_open_booking.dart';

import 'package:untitled1/view/profile/profile_view.dart';

bool newList = false;

class BookingMasterView extends GetView<MasterBookingController> {
  const BookingMasterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MasterBookingController());
    controller.getMasterBookingList();

    return Scaffold(
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
                        builder: (context) => const ProfileView()),
                  );
                },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
              ),),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getMasterBookingList();
                    controller.newList.value = false;
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2-24,
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
                    controller.newList.value = true;
                    controller.getNewMasterBookingList();
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2-24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: controller.newList.value == true
                          ? const Color(0xff8874ff)
                          : const Color(0xff363636),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
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
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 199,
            child: Obx(
              () => ListView(
                children: List.generate(
                    controller.newList.value == true
                        ? controller.masterNewBookingList.value.length
                        : controller.bookingList.value.length, (index) {
                  var item = controller.newList.value == true
                      ? controller.masterNewBookingList.value[index]
                      : controller.bookingList.value[index];
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
                                builder: (context) => ManagerOpenBooking(
                                  manager: false,
                                    carName: item['car_name'],
                                    description: item['description'],
                                    userEmail: item['user_email'],
                                    userName: item['user_name'],
                                    userPhone: item['user_phone'],
                                    delivery: item['delivery'],
                                    pickUp: item['pickup'],
                                    id: item['id'],
                                    garage: item['garage'],
                                    status: item['status'],
                                    carBrand: item['car_brand'],
                                    carModel: item['car_model'],
                                    carYear: item['car_year'],
                                    carReg: item['car_reg'])));
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
                                              'assets/icons/master_car.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            item['car_name'].toString(),
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
                              const SizedBox(
                                height: 16,
                              ),
                              item['status'] != 'Canceled'
                                  ? item['status'] != 'Approved'
                                      ? GestureDetector(
                                          onTap: () {
                                            controller.acceptBooking(
                                              id: item['id'],
                                            );
                                            ChatController().createChat(
                                                uid1: item['uid'],
                                                uid2: userModel!.uid,
                                                cid: item['sid'],
                                                type: 'booking');
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 230), () {
                                              newList == true
                                                  ? controller
                                                      .getNewMasterBookingList()
                                                  : controller
                                                      .getMasterBookingList();
                                            });
                                            showDialog<void>(
                                                useSafeArea: false,
                                                context: context,
                                                barrierDismissible:
                                                false, // user must tap button!
                                                builder: (BuildContext context) {
                                                  return const MyCustomAlert(text: 'Request approve');
                                                });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                32,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color(0xff40CC46),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/master_accept.svg'),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Text(
                                                  'ACCEPT',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            controller.cancelBooking(
                                              reason: '',
                                                id: item['id']);
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 230), () {
                                              newList == true
                                                  ? controller
                                                      .getNewMasterBookingList()
                                                  : controller
                                                      .getMasterBookingList();
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                32,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/booking_cancel.svg'),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                const Text(
                                                  'CANCEL',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'fvjffdfifoppjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkdjfdjfdififd',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
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
          )
        ],
      ),
    );
  }
}




class MyCustomAlert extends StatelessWidget {
  final String text;
  const MyCustomAlert({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
      const Color(0xff2D2D2D).withOpacity(0),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
          horizontal: 12),
      content: Container(
          height: 238,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff2D2D2D)
                .withOpacity(0.9),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white
                        .withOpacity(0.87),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context)
                      .size
                      .width -
                      64,
                  color: const Color(0xff979797),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 52,
                    width:
                    MediaQuery.of(context)
                        .size
                        .width -
                        52,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(
                          12),
                      color: const Color(
                          0xff8875FF),
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
