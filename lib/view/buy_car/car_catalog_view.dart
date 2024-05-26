// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/meneger_view/meneger_car_page_view.dart';
import '../../controller/car_controller.dart';
import '../../controller/get_user_info.dart';
import '../../controller/home_controller.dart';
import '../../server_routes.dart';
import '../profile/profile_view.dart';
import 'car_page_view.dart';

class CarCatalogView extends GetView<CarController> {
  const CarCatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarController());
    final home = Get.put(HomeController());
    final translate = Get.put(UserInfoController()).translateModel.value;
    controller.getCarList();
    return Scaffold(
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
              child: Stack(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0),
                      radius: 25,
                      backgroundImage: NetworkImage(
                          '${ServerRoutes.host}/avatar?path=avatar_${userModel!.uid}'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                home.selectIndex(1);
              },
              child: Image.asset(
              translate.buyCarBannerPath,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                   Text(
                    translate.inStock,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 437,
                    child: Obx(
                      () => GridView.count(
                        primary: false,
                        //   padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 30,
                        crossAxisCount: 2,
                        childAspectRatio: (100 / 129),
                        children: controller.cars.value.isEmpty
                            ? [
                                const CircularProgressIndicator(),
                                const CircularProgressIndicator()
                              ]
                            : List.generate(controller.cars.value.length,
                                (index) {
                                var item = controller.cars.value[index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CarPageView(
                                              images: item['images'],
                                                  cash: item['cash'],
                                                  ccid: item['ccid'],
                                                  transmission:
                                                      item['transmission']
                                                          .toString(),
                                                  serviceContract:
                                                      item['service_contact'],
                                                  name: item['name'].toString(),
                                                  priceUsd: item['price_usd']
                                                      .toString(),
                                                  priceAed: item['price_aed']
                                                      .toString(),
                                                  kilometrs: item['killometers']
                                                      .toString(),
                                                  year: item['year'].toString(),
                                                  body: item['body'].toString(),
                                                  state:
                                                      item['state'].toString(),
                                                  motorsTrim: item['motor_trim']
                                                      .toString(),
                                                  guarantee: item['guarantee']
                                                      .toString(),
                                                  steeringWheel:
                                                      item['steering_whell']
                                                          .toString(),
                                                  regionalSpecs:
                                                      item['regional_specs'],
                                                  color:
                                                      item['color'].toString(),
                                                  id: item['id'],
                                                  description:
                                                      item['description'],
                                                )));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Image.network(
                                            '${ServerRoutes.host}/test_photo?path=${item['ccid']}',
                                            height: 130,
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                          ),
                                          Positioned(
                                              right: 8,
                                              top: 3.5,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    item['liked'] == 'false'
                                                        ? controller.likeCar(
                                                            item['id'],
                                                            userModel!.uid)
                                                        : controller.dislikeCar(
                                                            item['like_id'],
                                                            item['id']);
                                                  },
                                                  child:
                                                      item['liked'] == 'false'
                                                          ? SvgPicture.asset(
                                                              'assets/icons/unlike.svg',
                                                              height: 20,
                                                              width: 20,
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/icons/like.svg',
                                                              height: 20,
                                                              width: 20,
                                                            ))),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                      '${formatPriceString(
                                          '${item['price_aed']}'
                                              .toString(),
                                        )} AED ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        item['name'].toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        '${item['year']}, ${formatPriceString(item['killometers'])} km',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Color(0xff7A7A7A),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
