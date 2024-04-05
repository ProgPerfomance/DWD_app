import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/master/booking_master_controller.dart';

import '../../master_view/booking_master_view.dart';
import 'manager_booking_select_garage.dart';

class ManagerOpenBooking extends GetView<MasterBookingController> {
  final String? carName;
  final String? carModel;
  final String? carBrand;
  final String? carYear;
  final String? userName;
  final String? userPhone;
  final String? userEmail;
  final String? description;
  final String? pickUp;
  final String? delivery;
  final String? carReg;
  final bool manager;
  final id;
  final status;
  final garage;
  const ManagerOpenBooking({
    super.key,
    required this.manager,
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
    required this.carBrand,
    required this.carModel,
    required this.carYear,
    required this.carReg,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/car.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carName.toString(),
                        style: _thisStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$carBrand $carModel',
                        style: _thisStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        carYear.toString(),
                        style: _thisStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        carReg.toString(),
                        style: _thisStyle,
                      ),
                    ],
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
              manager == true
                  ? Row(
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
                            garage == null && status == 'Pending'
                                ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManagerSelectGarage(
                                          booking: true,
                                        ))) : null;
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
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 24,
              ),
           manager == true ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  garage == null && status == 'Pending'
                      ? GestureDetector(
                    onTap: () {
                      controller.setGarage(
                          id: id, garage: controller.garage['id']);
                      Navigator.pop(context);
                      showDialog<void>(
                          useSafeArea: false,
                          context: context,
                          barrierDismissible:
                          false, // user must tap button!
                          builder: (BuildContext context) {
                            return const MyCustomAlert(text: 'Request sent!');
                          });
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
                      showDialog<void>(
                          useSafeArea: false,
                          context: context,
                          barrierDismissible:
                          false, // user must tap button!
                          builder: (BuildContext context) {
                            return CancelBookingDialog(id: id,);
                          });
                    //  controller.cancelBooking(id: id);
                   //   Navigator.pop(context);
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
              ) : const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
} //manager_service

TextStyle _thisStyle = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Colors.white,
);


class CancelBookingDialog extends GetView<MasterBookingController> {
  final id;
  const CancelBookingDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(MasterBookingController());
    TextEditingController inputController = TextEditingController();
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
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24,),
                const Center(
                  child: Text('Are you sure you want to cancel this appointment? Please describe the reason:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24,),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: inputController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                    const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Cancel reason',
                    isDense: true,
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff7A7A7A),
                          width: 1),
                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                      borderSide: const BorderSide(
                          color: Color(0xff7A7A7A),
                          width: 1),
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.cancelBooking(id: id, reason: inputController.text);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showDialog<void>(
                            useSafeArea: false,
                            context: context,
                            barrierDismissible:
                            false, // user must tap button!
                            builder: (BuildContext context) {
                              return const MyCustomAlert(text: 'Booking canceled!');
                            });
                      },
                      child: SizedBox(
                        height: 52,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width /
                            2 -
                            52,
                        child: const Center(
                          child: Text(
                            'YES',
                            style: TextStyle(
                              fontWeight:
                              FontWeight.w400,
                              fontSize: 16,
                              color:
                              Color(0xff8875FF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width /
                            2 -
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
                            'NO',
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
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
