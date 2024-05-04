import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/meneger_view/manager_services/add_garage_view.dart';
import 'package:untitled1/meneger_view/manager_services/edit_garage_view.dart';

class ManagerAllGarages extends GetView<ServicesController> {
  const ManagerAllGarages({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getGarages();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddGarageView()));
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Color(0xff8875FF)),
              )),
        ],
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'Garages',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: List.generate(controller.garages.length, (index) {
              final item = controller.garages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/buy.svg'),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              '${item['name']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditGarageView(
                                          password: item['password'],
                                          phone: item['phone'],
                                          email: item['email'],
                                          name: item['name'],
                                          id: item['id'])));
                            },
                            child: SvgPicture.asset(
                                'assets/icons/next_manager_purple.svg',color: Colors.white,)),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Divider(
                      height: 0.3,
                      color: Color(0xff1E1E1E),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
