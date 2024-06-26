import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/view/sell_car_view/sell_on_the_spot_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/get_user_info.dart';
import '../../domain/auth_user_domain.dart';
import '../../server_routes.dart';
import '../profile/profile_view.dart';
import 'consignment_view.dart';

openWhatsapp({required BuildContext context}) async {

  String whatsapp = '+971588800023';
  String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=hello";
  String whatsappURLIos =
      "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
      await launchUrl(Uri.parse(whatsappURLIos));
    } else {
    }
  } else {
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {}
  }
}

class SellCarView extends StatelessWidget {
  const SellCarView({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = Get.put(UserInfoController()).translateModel.value;
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
                      backgroundImage:AssetImage('assets/dwd_logo.jpeg'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0),
                      radius: 25,
                      backgroundImage: NetworkImage('${ServerRoutes.host}/avatar?path=avatar_${userModel!.uid}'),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              const SellCarBanner(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff363636),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 translate.consignment,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff8875FF),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(

                                translate.consignmentText,   style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                openWhatsapp(context: context);
                              },
                              child: SizedBox(
                                height: 52,
                                width: MediaQuery.of(context).size.width / 2 - 28,
                                child:  Center(
                                  child: Text(
                                    translate.chat,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff8687E7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ConsignmentView()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff8875FF),
                                ),
                                height: 52,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 28,
                                child:  Center(
                                  child: Text(
                                   translate.consignment,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff363636),
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 translate.spot ,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff8875FF),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                translate.spotText,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 52,
                              width: MediaQuery.of(context).size.width / 2 - 28,
                              child:  Center(
                                child: Text(
                                  translate.chat,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8687E7),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SellOnTheSpotView()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff8875FF),
                                ),
                                height: 52,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 28,
                                child:  Center(
                                  child: Text(
                                 translate.spot,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48,),
            ],
          ),
        ),
      ),
    );
  }
}

class SellCarBanner extends StatelessWidget {
  const SellCarBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final translate = Get.put(UserInfoController()).translateModel.value;
    return Container(
      height: 330,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff121212),
        Color(0xff8875FF),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
           Center(
              child: Text(
        translate.sellBannerTitle  ,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset('assets/1_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                    translate.transparency,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Text(
                  translate.sellBanner1  ,
                      style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/2_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                  translate.safety  ,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Text(
                     translate.sellBanner2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/3_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                     Text(
                      translate.trust,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Text(
                   translate.sellBanner3,
                      style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
