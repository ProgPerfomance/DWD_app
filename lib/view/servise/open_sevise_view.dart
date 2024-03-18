import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/view/servise/book_service_view.dart';

class OpenServiseView extends GetView<ServicesController> {
  final bool special;
  final String title;
  final int id;
  final String imagePath;
  final String? garage;
  const OpenServiseView({
    super.key,
    required this.special,
    required this.title,
    required this.imagePath,
    required this.id,
    required this.garage,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getServiceInfo(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: special == false
              ? BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imagePath,
                      ),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth))
              : const BoxDecoration(
                  color: Color(0xff40CC46),
                ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/arrowleft.png')),
                  ),
                  const SizedBox(
                    height: 8.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Obx(
                      () => Text(
                        '${controller.price.value}\$',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Color(0xff8875FF)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        Image.asset('assets/line.png'),
                        Obx(
                          () => Text(
                            'was ${controller.lowPrice.value}\$',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 238,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 61,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xffffffff),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(() => Text(
                              controller.description.value,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "What's Included",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xffffffff),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              controller.included.length,
                              (index) => Text(
                                controller.included[index]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffffffff)),
                              ),
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          "What's NOT Included",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xffffffff),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              controller.notIncluded.length,
                              (index) => Text(
                                controller.notIncluded[index]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xffffffff)),
                              ),
                            ).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookServiceView(
                                          id: id,
                                    garage: garage,
                                    offer: special,
                                        )));
                          },
                          child: Container(
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color(0xff8875FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Book',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
