import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/master_view/master_create_offer.dart';
import 'package:untitled1/meneger_view/manager_services/manager_servises.dart';
import 'package:untitled1/meneger_view/manager_services/manager_servises_view.dart';

import '../view/profile/profile_view.dart';

class MasterOffersView extends GetView<ServicesController> {
  const MasterOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getMyOffers(garage: userModel!.uid);
    return Scaffold(
      backgroundColor: const Color(0xff121212),
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
                  MaterialPageRoute(builder: (context) => const ProfileView()),
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
      body: SizedBox(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.count(
              primary: false,
              //   padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: (100 / 80),
              children: List.generate(controller.myOffers.length + 1, (index) {
                var item;
                if (index > 0) {
                  item = controller.myOffers[index - 1];
                }

                return index == 0
                    ? Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MasterCreateOffer()));
                          },
                          child: Container(
                            height: 140,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff2F2F2F),
                                border:
                                    Border.all(color: const Color(0xff8875FF))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/new_offer.svg'),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'New Offer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8875FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditServiceManager(
                                        title: item['name'], id: item['id'])));
                          },
                          child: Container(
                            width: 150,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff8875FF),
                                      Color(0xff40CC46)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22,
                                        color: Color(0xffffffff)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    item['price'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Image.asset('assets/line.png'),
                                      Text(
                                        item['low_price'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: index == 0
                                              ? const Color(0xffffffff)
                                              : const Color(0xff7A7A7A),
                                        ),
                                      ),
                                    ],
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
        ),
      ),
    );
  }
}
