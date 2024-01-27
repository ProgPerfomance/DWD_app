// ignore_for_file: invalid_use_of_protected_member, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/booking_controller.dart';
import '../profile/profile_view.dart';

class BookingListView extends GetView<BookingController> {
  const BookingListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    controller.getUserBooking();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'DWD',
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
                child: Image.asset('assets/testava.png')),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: Obx(() => SafeArea(
            child: controller.bookingList.value.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Image.asset('assets/booking_emp.png')),
                      const SizedBox(
                        height: 18,
                      ),
                      const Center(
                        child: Text(
                          'No bookings yet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Text(
                          'Add your cars to book services faster',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.87),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 17.0),
                            child: Column(
                              children: List.generate(
                                  controller.bookingList.value.length, (index) {
                                var item = controller.bookingList.value[index];
                                String date = item['date_time']
                                    .toString()
                                    .substring(0, 10);
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xff363636),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 34,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0,
                                          bottom: 16,
                                          left: 16,
                                          right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  width: 154,
                                                  height: 55.3,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0, left: 16),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/icons/booking_time.svg'),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              '${time}',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                        0xffffffff)
                                                                    .withOpacity(
                                                                        0.87),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: const Color(
                                                                        0xffffffff)
                                                                    .withOpacity(
                                                                        0.87),
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
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color:
                                                      const Color(0xffFA0E0E),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item['status'],
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                            height: 56,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Major Service',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 22,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    45,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      45,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/icons/booking_change.svg'),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      const Text(
                                                        'CHANGE',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          )
                                        ],
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
                  ),
          )),
    );
  }
}

Future<void> a(
    {required sid,
    required cid,
    required uid,
    required owner_name,
    required owner_email,
    required owner_phone,
    required pickup,
    required delivery,
    required timestamp}) async {
  String b =
      "insert into booking (id, sid, cid, uid, owner_name,owner_email, owner_phone, pickup, delivery,timestamp, status) values (0, $sid, $cid, $uid, '$owner_name', '$owner_email', '$owner_phone', '$pickup', '$delivery', '$timestamp' 'Pending');";
}

var data;

Map c = {
  'id': data['id'],
  'sid': data['sid'],
  'cid': data['cid'],
  'uid': data['uid'],
  'owner_name': data['owner_name'],
  'owner_email': data['owner_email'],
  'owner_phone': data['owner_phone'],
  'pickup': data['pickup'],
  'delivery': data['delivery'],
  'timestamp': data['timestamp'],
  'date_time': data['date_time'],
  'status': data['status'],
};
String test =
    "create table service_blocs (id int primary key, sid int, price int, title longtext, included bool);";

String adServise = "";
