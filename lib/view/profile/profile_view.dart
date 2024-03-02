// ignore_for_file: prefer_typing_uninitialized_variables, invalid_use_of_protected_member, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/domain/get_user_info.dart';
import 'package:untitled1/view/onboarding/onboarding_1_view.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'car_list_view.dart';
import 'farorit_cars_view.dart';

class ProfileView extends GetView<UserInfoController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<AuthController>();
    Get.put(UserInfoController());
    controller.getUserInfo(userModel!.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
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
              const Center(child:CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
              ),),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Obx(
                  () => Text(
                    controller.user.value['name'].toString(), //  user.userModel!.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavoritCarsView()));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 - 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff363636),
                      ),
                      child: const Center(
                        child: Text(
                          'WISHLIST',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarListView()));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff8875FF),
                      ),
                      child: const Center(
                        child: Text(
                          'MY CARS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), //333
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xffAFAFAF),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     IconAndTextWidget(
                      icon: 'assets/icons/change_name.svg',
                      text: 'Change account name',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        //      Get.bottomSheet(Container());
                      },
                      child:  IconAndTextWidget(
                        icon: 'assets/icons/change_photo.svg',
                        text: 'Change account image',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     IconAndTextWidget(
                      icon: 'assets/icons/change_language.svg',
                      text: 'Change account language',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     IconAndTextWidget(
                      icon: 'assets/icons/delete_account.svg',
                      text: 'Delete account',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'Information',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xffAFAFAF),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        var url = Uri.parse('https://dubaiwd.com/');
                        //     launchUrl(url); //https://www.facebook.com/DubaiWD/about
                      },
                      child:  IconAndTextWidget(
                        icon: 'assets/icons/about_ass.svg',
                        text: 'About us',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        var url = Uri.parse(
                            'https://www.facebook.com/DubaiWD/about'); //info@dubaiwd.com
                        //    launchUrl(url); //
                      },
                      child:  IconAndTextWidget(
                        icon: 'assets/icons/faqsvg.svg',
                        text: 'FAQ',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {
                        var url = Uri.parse(
                            'https://info@dubaiwd.com'); //info@dubaiwd.com
                        //  launchUrl(url); //
                      },
                      child:  IconAndTextWidget(
                        icon: 'assets/icons/help_feedback.svg',
                        text: 'Help & Feedback',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     IconAndTextWidget(
                      icon: 'assets/icons/support_us.svg',
                      text: 'Support Us',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                     GestureDetector(
                       onTap: ()async {
                         FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
                          await flutterSecureStorage.delete(key: 'uid');
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Onboarding1View()), (route) => false);
                       },
                       child: IconAndTextWidget(
                        icon: 'assets/icons/meneger_logout.svg',
                        text: 'Log out',
                        color: Colors.red,
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

class IconAndTextWidget extends StatelessWidget {
  final icon;
  final text;
  Color? color;
  IconAndTextWidget({super.key, required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 24,
          width: 24,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color ?? Colors.white),
        ),
//'Change account name' 'assets/changename.png'
      ],
    );
  }
}
