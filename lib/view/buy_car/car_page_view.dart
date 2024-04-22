// ignore_for_file: invalid_use_of_protected_member, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/view/chat/chat_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/car_controller.dart';
import '../../controller/chat_controller.dart';
import '../../domain/auth_user_domain.dart';
import '../../meneger_view/meneger_car_page_view.dart';
import '../../server_routes.dart';

class CarPageView extends GetView<CarController> {
  final String name;
  final String id;
  final String? priceUsd;
  final String? priceAed;
  final String color;
  final String description;
  final String? kilometrs;
  final String regionalSpecs;
  final String? cash;
  final String transmission;
  final String steeringWheel;
  final String motorsTrim;
  final String body;
  final String state;
  final String guarantee;
  final String year;
  final String serviceContract;
  final String ccid;
  final int images;
  const CarPageView(
      {super.key,
      required this.cash,
      required this.transmission,
      required this.steeringWheel,
      required this.state,
      required this.serviceContract,
      required this.regionalSpecs,
      required this.motorsTrim,
      required this.kilometrs,
      required this.guarantee,
      required this.color,
      required this.priceAed,
      required this.priceUsd,
      required this.body,
      required this.name,
      required this.year,
      required this.ccid,
      required this.id,
      required this.description,
      required this.images});

  @override
  Widget build(BuildContext context) {
    Get.put(CarController());
    print('картинки  $images');
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.getCarInfo(id);

    });
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Share.share(
                      '${ServerRoutes.host}/get_photo?path=$ccid&ind=${1}\n Look at the ad: $name\n');
                },
                child: SvgPicture.asset('assets/icons/upload.svg')),
            const SizedBox(
              width: 8,
            ),
            Obx(
              () => SizedBox(
                child: controller.liker.value == 'false'
                    ? GestureDetector(
                        onTap: () {
                          controller.likeCar(id, userModel!.uid);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/unlike.svg',
                          height: 24,
                          width: 24,
                          color: Colors.white,
                        ))
                    : GestureDetector(
                        onTap: () {
                          controller.dislikeCar(controller.likeId, id);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/like.svg',
                          height: 24,
                          width: 24,
                        )),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 244,
                  child:PageView(
                      children: List.generate(images, (index) {
                        return GestureDetector(
                          onTap: () {
                            showDialog<void>(
                                useSafeArea: false,
                                context: context,
                                barrierDismissible: true, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor:
                                        const Color(0xff2D2D2D).withOpacity(0),
                                    contentPadding: EdgeInsets.zero,
                                    insetPadding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    content: InteractiveViewer(
                                      boundaryMargin: EdgeInsets.all(20.0),
                                      minScale: 0.7,
                                      maxScale: 2.3,
                                      child: Image.network(
                                        '${ServerRoutes.host}/get_photo?path=$ccid&ind=${index + 1}',
                                        width: MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Image.network(
                            '${ServerRoutes.host}/get_photo?path=$ccid&ind=${index + 1}',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    ),
                  ),

                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${formatPriceString(priceUsd!)} \$ / ${formatPriceString(priceAed!)} AED',
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        cash == '1' ? 'Cash or finance' : 'Cash only',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7A7A7A),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                callNumber(userModel!.managerPhone);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff40CC46),
                                ),
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2 - 33,
                                child: const Center(
                                  child: Text(
                                    'CALL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            GestureDetector(
                              onTap: () async {
                                int cid = await ChatController().createChat(
                                    uid1: userModel!.uid,
                                    uid2: 0,
                                    cid: id.toString(),
                                    type: 'car');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatView(
                                              chatId: cid.toString(),
                                              opponentName: name,
                                              sid: id,
                                              carId: ccid,
                                              uidOpponent: 0,
                                              carIndex: id,
                                              type: 'car',
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xff8875FF),
                                ),
                                height: 60,
                                width: MediaQuery.of(context).size.width / 2 - 33,
                                child: const Center(
                                  child: Text(
                                    'CHAT',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Car details',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextCascadeWidget(
                          field: 'Year:', parametr: year.toString()),
                      TextCascadeWidget(
                          field: 'Color:', parametr: color.toString()),
                      TextCascadeWidget(
                          field: 'Kilometers:',
                          parametr: formatPriceString(kilometrs.toString())),
                      TextCascadeWidget(
                          field: 'Regional Specs:',
                          parametr: regionalSpecs.toString()),
                      TextCascadeWidget(
                          field: 'Transmission:',
                          parametr: transmission.toString()),
                      // TextCascadeWidget(
                      //     field: 'Steering wheel:',
                      //     parametr: steeringWheel.toString()),
                      TextCascadeWidget(
                          field: 'Motors Trim:', parametr: motorsTrim.toString()),
                      TextCascadeWidget(
                          field: 'Body:', parametr: body.toString()),
                      // TextCascadeWidget(
                      //     field: 'State:', parametr: state.toString()),
                      TextCascadeWidget(field: 'Warranty:', parametr: guarantee),
                      TextCascadeWidget(
                          field: 'Service contract:', parametr: serviceContract),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'Ask the seller',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      AskSellerWidget(
                        id: id.toString(),
                        name: name,
                        ccid: ccid,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'More cars',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Color(0xffffffff)),
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
                                                      cash: item['cash'],
                                                      transmission:
                                                          item['transmission']
                                                              .toString(),
                                                      serviceContract:
                                                          item['service_contact'],
                                                      name:
                                                          item['name'].toString(),
                                                      priceUsd: item['price_usd']
                                                          .toString(),
                                                      priceAed: item['price_aed']
                                                          .toString(),
                                                      kilometrs:
                                                          item['killometers']
                                                              .toString(),
                                                      year:
                                                          item['year'].toString(),
                                                      body:
                                                          item['body'].toString(),
                                                      state: item['state']
                                                          .toString(),
                                                      motorsTrim:
                                                          item['motor_trim']
                                                              .toString(),
                                                      guarantee: item['guarantee']
                                                          .toString(),
                                                      steeringWheel:
                                                          item['steering_whell']
                                                              .toString(),
                                                      regionalSpecs:
                                                          item['regional_specs'],
                                                      color: item['color']
                                                          .toString(),
                                                      id: item['id'],
                                                      description:
                                                          item['description'],
                                                  images: item['images'],
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
                                                            : controller
                                                                .dislikeCar(
                                                                    item[
                                                                        'like_id'],
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
                                            '${item['price_aed']} AED '
                                                .toString(),
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
                )
              ],
            ),
          ),

      ),
    );
  }
}

class TextCascadeWidget extends StatelessWidget {
  final String field;
  final String parametr;
  const TextCascadeWidget(
      {super.key, required this.field, required this.parametr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.93),
      child: Row(
        children: [
          Text(
            field,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff7A7A7A) //#7A7A7A
                ),
          ),
          const SizedBox(
            width: 5.3,
          ),
          Text(
            parametr,
            style: const TextStyle(color: Color(0xffffffff) //#7A7A7A
                ),
          ),
        ],
      ),
    );
  }
}

class AskSellerWidget extends StatelessWidget {
  final ccid;
  final id;
  final name;
  const AskSellerWidget(
      {super.key, required this.name, required this.id, required this.ccid});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  int cid = await ChatController().createChat(
                      uid1: userModel!.uid,
                      uid2: 0,
                      cid: id.toString(),
                      type: 'car');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatView(
                                sid: id,
                                chatId: cid.toString(),
                                opponentName: name,
                                message: 'Still for sale?',
                                carId: ccid,
                                uidOpponent: 0,
                                carIndex: id,
                                type: 'car',
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff8875FF)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: Text(
                      'Still for sale?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () async {
                  int cid = await ChatController().createChat(
                      uid1: userModel!.uid,
                      uid2: 0,
                      cid: id.toString(),
                      type: 'car');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatView(
                                chatId: cid.toString(),
                                opponentName: name,
                                sid: id,
                                message: 'Is exchange possible?',
                                carId: ccid,
                                uidOpponent: 0,
                                carIndex: id,
                                type: 'car',
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff8875FF)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: Text(
                      'Is exchange possible?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  int cid = await ChatController().createChat(
                      uid1: userModel!.uid,
                      uid2: 0,
                      cid: id.toString(),
                      type: 'car');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatView(
                                chatId: cid.toString(),
                                opponentName: name,
                                message: 'Where can I watch it?',
                                carId: ccid,
                                sid: id,
                                uidOpponent: 0,
                                carIndex: id,
                                type: 'car',
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff8875FF)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: Text(
                      'Where can I view it?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void callNumber(String phoneNumber) async {
  String telUrl = 'tel:$phoneNumber';
  if (await canLaunch(telUrl)) {
    await launch(telUrl);
  } else {
    throw 'Could not launch $telUrl';
  }
}
