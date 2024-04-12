import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/get_sell_cars.dart';
import 'package:untitled1/meneger_view/manager_sell_car_info.dart';

import 'meneger_profile_view.dart';

class ManagerSellCar extends GetView<SellCarManagerController> {
  const ManagerSellCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SellCarManagerController());
    controller.getSellCarsList();
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'Sell a car',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Applications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => Column(
                  children: List.generate(controller.carList.length, (index) {
                    var item = controller.carList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManagerSellCarInfo(
                                      year: item['year'],
                                      ownerEmail: item['owner_email'],
                                      ownerName: item['owner_name'],
                                      model: item['model'],
                                      brand: item['brand'],
                                      carName: item['name'],
                                      ownerPhone: item['owner_phone'],
                                      regNumber: item['car_reg'],
                                  type: item['type'],
                                  timestamp: item['timestamp'],
                                    )));
                      },
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
                                    '${item['year']} + ${item['brand']} + ${item['model']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                  'assets/icons/next_manager_purple.svg'),
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
            const SizedBox(
              height: 135,
            ),
          ],
        ),
      ),
    );
  }
}
