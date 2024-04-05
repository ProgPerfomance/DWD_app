import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

import '../manager_booking/manager_booking_select_garage.dart';

FocusNode _focusNode = FocusNode();
TextEditingController _offerTitleController = TextEditingController();
TextEditingController _offerPriceController = TextEditingController();
TextEditingController _offerLowPriceController = TextEditingController();
TextEditingController _offerDescriptionController = TextEditingController();

class ManagerCreateOffer extends GetView<ServicesController> {
  const ManagerCreateOffer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create offer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff40CC46),
        ),
        backgroundColor: const Color(0xff40CC46),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 130,
              decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Offer title',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextField(
                        controller: _offerTitleController,
                        hintText: 'Offer title'),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Offer price',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextField(
                        controller: _offerPriceController,
                        hintText: 'Offer price'),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Offer new price',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultTextField(
                        controller: _offerLowPriceController,
                        hintText: 'Offer new price'),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Offer description',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      focusNode: _focusNode,
                      maxLines: 10,
                      minLines: 5,
                      maxLength: 1000,
                      controller: _offerDescriptionController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff1D1D1D),
                        hintStyle: const TextStyle(
                          color: Color(
                            0xFFCBCBCB,
                          ),
                        ),
                        hintText: 'Offer description',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
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
                                        const ManagerSelectGarage(
                                          booking: false,
                                        )));
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
                    InkWell(
                      onTap: () {
                        controller.createOffer(
                            name: _offerTitleController.text,
                            garage: controller.garage['id'],
                            price: _offerPriceController.text,
                            lowPrice: _offerLowPriceController.text,
                            description: _offerDescriptionController.text);
                        Navigator.pop(context);
                        controller.getMyOffers(garage: userModel!.uid);
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
                            'Create',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const DefaultTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff1D1D1D),
        hintStyle: const TextStyle(
          color: Color(
            0xff535353,
          ),
        ),
        hintText: hintText,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff7A7A7A), width: 1),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: const BorderSide(color: Color(0xff7A7A7A), width: 1),
        ),
      ),
    );
  }
}
