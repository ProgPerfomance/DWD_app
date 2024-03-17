import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:untitled1/controller/master/booking_master_controller.dart';
import 'package:untitled1/controller/services_controller.dart';


class ManagerSelectGarage extends GetView<ServicesController> {
  const ManagerSelectGarage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    final garage = Get.put(MasterBookingController());
    controller.getGarages();
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: List.generate(controller.garages.length, (index) {
              final item = controller.garages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    garage.selectGarage({'title': item['name'], 'id': item['id']});
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
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
                      const SizedBox(
                        height: 24,
                      ),
                      const Divider(
                        height: 0.3,
                        color: Color(0xff1E1E1E),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
