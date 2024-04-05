import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/meneger_view/manager_services/all_garages.dart';
import 'package:untitled1/meneger_view/manager_services/manager_create_offer.dart';
import 'package:untitled1/meneger_view/manager_services/manager_servises.dart';
import '../../master_view/master_create_offer.dart';
import '../../view/servise/open_sevise_view.dart';

class ManagerServiceView extends GetView<ServicesController> {
  const ManagerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getLastOffers(garage: 0);
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
                    MaterialPageRoute(
                        builder: (context) => const ManagerAllGarages()),
                  );
                },
                child: const Text(
                  'All garages',
                  style: TextStyle(color: Color(0xff8875FF)),
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Special offers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.lastSpecialOffers.length+1,
                          itemBuilder: (context, index) {
                            var item;
                            if (index > 0) {
                              item = controller.lastSpecialOffers[index-1];
                            }

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: index == 0 ?
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ManagerCreateOffer()));
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
                              ) :
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditServiceManager(
                                                  title: item['name'],
                                                  id: item['id'])));
                                },
                                child: Container(
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: index == 0 ? null : Colors.white,
                                    gradient: index == 0
                                        ? const LinearGradient(
                                            colors: [
                                                Color(0xff8875FF),
                                                Color(0xff40CC46)
                                              ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)
                                        : null,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 22,
                                            color: index == 0
                                                ? const Color(0xffffffff)
                                                : const Color(0xff8875FF),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '${item['price']} AED',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Image.asset('assets/line.png'),
                                            Text(
                                              'was ${item['low_price']} AED',
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
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Service',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'General\nrepair',
                        icon: 'assets/icons/general_repair.svg',
                        id: 0,
                      ),
                      ManagerServiceButton(
                        text: 'Interval\nservice',
                        icon: 'assets/icons/interval_service.svg',
                        id: 1,
                      ),
                      ManagerServiceButton(
                        text: 'Recovery',
                        icon: 'assets/icons/recovery.svg',
                        id: 2,
                      ),
                      ManagerServiceButton(
                        text: 'Wheels and\ntires',
                        icon: 'assets/icons/general2.svg',
                        id: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ), //  text: 'General\nrepair','Interval\nservice', 'Gearbox\nrepair','Wheels','Brakes','Battery', 'AC repair', 'Wrapping &\nPPF',   text: 'Tinting', text: 'Detailing',
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Brakes',
                        icon: 'assets/icons/brakes.svg',
                        id: 4,
                      ),
                      ManagerServiceButton(
                        text: 'Battery',
                        icon: 'assets/icons/battary.svg',
                        id: 5,
                      ),
                      ManagerServiceButton(
                        text: 'AC repair',
                        icon: 'assets/icons/ac.svg',
                        id: 6,
                      ),
                      ManagerServiceButton(
                        text: 'Wrapping &\nPPF',
                        icon: 'assets/icons/ppf.svg',
                        id: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Tinting',
                        icon: 'assets/icons/tinting.svg',
                        id: 8,
                      ),
                      ManagerServiceButton(
                        text: 'Detailing',
                        icon: 'assets/icons/detaling.svg',
                        id: 9,
                      ),
                      ManagerServiceButton(
                        text: 'Insurance',
                        icon: 'assets/icons/insurance.svg',
                        id: 10,
                      ),
                      ManagerServiceButton(
                        text: 'Car Rent',
                        icon: 'assets/icons/carrent.svg',
                        id: 11,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Storage',
                        icon: 'assets/icons/storage.svg',
                        id: 12,
                      ),

                      ManagerServiceButton(
                        text: 'Body repair\nand paint',
                        icon: 'assets/icons/body.svg.svg',
                        id: 21,
                      ),
                      ManagerServiceButton(
                        text: 'Pre-purchase\ninspection',
                        icon: 'assets/icons/inspec.svg',
                        id: 22,
                      ),
                      SizedBox(
                        width: 72,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 73,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ManagerServiceButton extends StatelessWidget {
  final icon;
  final text;
  final int id;
  const ManagerServiceButton(
      {super.key, required this.text, required this.icon, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditServiceManager(
                      title: text,
                      id: id,
                    )));
      },
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xff363636),
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }
}
