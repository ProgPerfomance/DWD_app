import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../../controller/get_user_info.dart';
import '../../domain/booking_domain.dart';
import '../../domain/get_user_cars.dart';
import '../servise/select_car_booking_view.dart';

String _time = 'Select data & time';

TextEditingController _pickupController = TextEditingController();
TextEditingController _deliveryController = TextEditingController();
TextEditingController _ownerNameController = TextEditingController();
TextEditingController _ownerNumberController = TextEditingController();
TextEditingController _ownerEmailController = TextEditingController();
String car = 'Select car';

class UpdateBookingView extends GetView<GetUserCars> {
  final id;
  final pickup;
  final delivery;
  final ownerName;
  final ownerNumber;
  final ownerEmail;
  final carNew;
  const UpdateBookingView(
      {super.key,
      required this.id,
      required this.carNew,
      required this.delivery,
      required this.pickup,
      required this.ownerEmail,
      required this.ownerName,
      required this.ownerNumber});

  @override
  Widget build(BuildContext context) {
    Get.put(GetUserCars());
   _pickupController.text = pickup.toString();
     _deliveryController.text = delivery.toString();
     _ownerNameController.text = ownerName.toString();
     _ownerNumberController.text = ownerNumber.toString();
     _ownerEmailController.text = ownerEmail.toString();
     controller.car.value = carNew;
    final translate = Get.put(UserInfoController()).translateModel.value;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:  Text(
                          translate.back,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff8875FF),
                          ),
                        )),
                     Text(
                      translate.booking,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      translate.ownerName,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: _ownerNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xff535353,
                          ),
                        ),
                        hintText: translate.ownerName,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                     translate.mobilePhone,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: _ownerNumberController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xff535353,
                          ),
                        ),
                        hintText: translate.mobilePhone,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                      translate.email,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: _ownerEmailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xff535353,
                          ),
                        ),
                        hintText: translate.email,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectCarBookingView(
                                      sell: false,
                                    )));
                      },
                      child: Row(
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
                          Obx(
                            () => Text(
                              controller.car.value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff8687E7)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff40CC46)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/icons/good_cloud.svg'),
                            const SizedBox(
                              width: 12,
                            ),
                             Text(
                             translate.bookingText,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Color(0xffffffff),
                      ),
                      controller: _pickupController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xff535353,
                          ),
                        ),
                        hintText: translate.addPickup,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      style: const TextStyle(
                        color: Color(0xffffffff),
                      ),
                      controller: _deliveryController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xff535353,
                          ),
                        ),
                        hintText: translate.addDelivery,
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                              color: Color(0xff7A7A7A), width: 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                      translate.selectDate,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SelectDateWidget(),
                    const SizedBox(
                      height: 28,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_time != 'Select Date & Time') {
                          BookingDomain().createBooking(
                              sid: id,
                              cid: 1,
                              uid: 1,
                              description: '',
                              owner_name: _ownerNameController.text,
                              owner_email: _ownerEmailController.text,
                              owner_phone: _ownerNumberController.text,
                              pickup: _pickupController.text,
                              delivery: _deliveryController.text,
                              timestamp: DateTime.now().toString(),
                              date_time: _time);

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(errorSnackBar);
                        }
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width - 32,
                        decoration: BoxDecoration(
                          color: const Color(0xff8875FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(
                          child: Text(
                          translate.send,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
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

class BookingCheckBoxWidget extends StatefulWidget {
  final Widget form;
  final text;
  const BookingCheckBoxWidget(
      {super.key, required this.text, required this.form});
  @override
  State<BookingCheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<BookingCheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
        ),
        press == false
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: widget.form,
              ),
      ],
    );
  }
}

SnackBar errorSnackBar = const SnackBar(
  content: Text('Date not selected'),
  backgroundColor: Colors.red,
);

class SelectDateWidget extends StatefulWidget {
  const SelectDateWidget({super.key});

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          pickerMode: DateTimePickerMode.datetime,
          initialDateTime: DateTime.now().add(const Duration(days: 1)),
          minDateTime: DateTime.now(),
          maxDateTime: DateTime.now().add(const Duration(days: 365)),
          locale: DateTimePickerLocale.en_us,
          dateFormat: "dd MMMM yyyy HH:mm",
          onChange: (dateTime, selectedIndex) {
            _time = dateTime.toString().substring(0, 16);
            setState(() {});
          },
          onConfirm: (dateTime, selectedIndex) {
            _time = dateTime.toString().substring(0, 16);
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 25,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff1D1D1D),
            border: Border.all(color: const Color(0xff7A7A7A))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/calendar.svg'),
              const SizedBox(
                width: 8,
              ),
              Text(
                _time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
