// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:svg_flutter/svg.dart';

import '../view/onboarding/onboarding_1_view.dart';

class MenegerProfileView extends StatelessWidget {
  const MenegerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title:
        const Text(
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
       const Center(
         child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
            ),
       ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  '',  //  user.userModel!.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),//333
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
                    const IconAndTextWidget(
                      color: Colors.white,
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
                      child: const IconAndTextWidget(
                        color: Colors.white,
                        icon: 'assets/icons/change_photo.svg',
                        text: 'Change account image',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      color: Colors.white,
                      icon: 'assets/icons/change_language.svg',
                      text: 'Change account language',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      color: Colors.white,
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
                    const IconAndTextWidget(
                      color: Colors.white,
                      icon: 'assets/icons/about_ass.svg',
                      text: 'About us',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      color: Colors.white,
                      icon: 'assets/icons/faqsvg.svg',
                      text: 'FAQ',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      color: Colors.white,
                      icon: 'assets/icons/help_feedback.svg',
                      text: 'Help & Feedback',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      color: Colors.white,
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
                      child: const IconAndTextWidget(
                        color: Colors.red,
                        icon: 'assets/icons/meneger_logout.svg',
                        text: 'Log out',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
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
  final color;
  const IconAndTextWidget({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 24,width: 24,),
        const SizedBox(
          width: 16,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
        ),),
//'Change account name' 'assets/changename.png'
      ],
    );
  }
}
