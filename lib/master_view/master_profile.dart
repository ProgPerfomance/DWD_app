// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';


class MasterProfileView extends StatelessWidget {
  const MasterProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<AuthController>();
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
              Center(child: Image.asset('assets/avatargrad.png')),
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
                        icon: 'assets/icons/change_photo.svg',
                        text: 'Change account image',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      icon: 'assets/icons/change_language.svg',
                      text: 'Change account language',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
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
                      icon: 'assets/icons/about_ass.svg',
                      text: 'About us',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      icon: 'assets/icons/faqsvg.svg',
                      text: 'FAQ',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      icon: 'assets/icons/help_feedback.svg',
                      text: 'Help & Feedback',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const IconAndTextWidget(
                      icon: 'assets/icons/support_us.svg',
                      text: 'Support Us',
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
  const IconAndTextWidget({super.key, required this.icon, required this.text});

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
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xffffffff)),
        ),
//'Change account name' 'assets/changename.png'
      ],
    );
  }
}
