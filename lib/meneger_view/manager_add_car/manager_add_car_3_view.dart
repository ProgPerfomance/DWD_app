import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/meneger_view/meneger_home_view.dart';
import 'package:uuid/uuid.dart';

import '../../server_routes.dart';

FocusNode _focusNode = FocusNode();
TextEditingController descriptionController = TextEditingController();

class ManagerAddCar3View extends StatefulWidget {
  final String model;
  final String price_AED;
  final String price_USD;
  final String color;
  final String miliege;
  final String regionalSpecs;
  final String transmission;
  final String motorTrim;
  final String body;
  final String gurantee;
  final String serviceContact;
  final String brand;
  final String year;
  final String name;
  final  photos;
  const ManagerAddCar3View(
      {super.key,
      required this.model,
      required this.motorTrim,
      required this.price_AED,
      required this.color,
      required this.gurantee,
      required this.miliege,
      required this.regionalSpecs,
      required this.serviceContact,
      required this.body,
        required this.brand,
      required this.transmission,
        required this.price_USD,
        required this.photos,
        required this.year,
        required this.name,
      });

  @override
  State<ManagerAddCar3View> createState() => _ManagerAddCar3ViewState();
}

class _ManagerAddCar3ViewState extends State<ManagerAddCar3View> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                        'Car page',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff7A7A7A), //0xff7A7A7A
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  '3/3 Description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  focusNode: _focusNode,
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 1000,
                  controller: descriptionController,
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
                    hintText: '',
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
                GestureDetector(
                  onTap: () {
                    _uploadImages();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenegerHomeView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      color: const Color(0xff8875FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _uploadImages() async {
    Uuid uuid = const Uuid();
    String ccid = await uuid.v1();
    if (widget.photos.isEmpty) {
      print('No images selected.');
      return;
    }

    List<Map<String, dynamic>> images = [];
    int index=1;
    for (var imageFile in widget.photos) {
      String fileName = imageFile.path.split('/').last;
      List<int> bytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(bytes);
      images.add({'name': '$index.jpg', 'data': base64Image});
     index++;
    }

    var folderName = ccid;

    Dio dio = Dio();
    final response = await dio.post(
      '${ServerRoutes.host}/create_car',
      options: Options(headers: {
        'folder-name': folderName,
      }),
      data: jsonEncode({
        'images': images,
        'ccid': ccid.toString(),
        'brand': widget.brand.toString(),
        'body': widget.body.toString(),
        'price_aed': widget.price_AED.toString(),
        'price_usd': widget.price_USD.toString(),
        'model': widget.model.toString(),
        'killometers': widget.miliege.toString(),
        'color': widget.color.toString(),
        'regional_specs': widget.regionalSpecs.toString(),
        'steering_whell': false.toString(),
        'motor_trim': widget.motorTrim.toString(),
        'guarantee': widget.gurantee.toString(),
        'service_contact': widget.serviceContact.toString(),
        'description': descriptionController.text.toString(),
        'name': widget.name.toString(),
        'year': widget.year.toString(),
        'transmission': widget.transmission.toString(),
      }),
    );
    print(response.data);
  }
}


