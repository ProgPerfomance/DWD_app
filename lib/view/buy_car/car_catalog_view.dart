// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import '../../controller/home_controller.dart';
import '../../domain/get_cars_list_domain.dart';
import '../profile/profile_view.dart';
import 'car_page_view.dart';

class CarCatalogView extends GetView<GetCarList> {
  const CarCatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetCarList());
   final home = Get.put(HomeController());
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
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
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
              onTap: (){
                home.selectIndex(1);
              },
              child: Image.asset(
                'assets/buy_banner.png',
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
                  const Text(
                    'In Stock',
                    style: TextStyle(
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
                        children: controller.cars.value.length < 2
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
                                                  ccid: item['ccid'],
                                                  liked: item['liked'],
                                                  transmission:
                                                      item['transmission']
                                                          .toString(),
                                                  serviceContract:
                                                      item['service_contact'],
                                                  name: item['name'].toString(),
                                                  price_usd: item['price_usd']
                                                      .toString(),
                                                  price_aed: item['price_aed']
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
                                            'http://63.251.122.116:2308/test_photo?path=${item['ccid']}',
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
                                                            item['like_id']);
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
                                        '${item['price_aed']} AED '
                                            .toString(), //anketss['price_euro'].toString(),
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
                                        item['name']
                                            .toString(), // anketss['name'],
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
                                        '${item['year']}, ${item['killometers']}',
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
