// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

import '../controller/get_user_info.dart';
import '../view/onboarding/onboarding_1_view.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _phoneController = TextEditingController();

class MenegerProfileView extends GetView<UserInfoController> {
  const MenegerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
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
              const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
               Center(
                child: Text(
                  userModel!.name, //  user.userModel!.name,
                  style: const TextStyle(
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
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                            useSafeArea: false,
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return const ChangeDataController(
                                type: UserDataType.name,
                              );
                            });
                      },
                      child: const IconAndTextWidget(
                        color: Colors.white,
                        icon: 'assets/icons/change_name.svg',
                        text: 'Change account name',
                      ),
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
                    GestureDetector(
                      onTap: () {
                        showDialog<void>(
                            useSafeArea: false,
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return const ChangeDataController(
                                type: UserDataType.phone,
                              );
                            });
                      },
                      child: const IconAndTextWidget(
                        color: Colors.white,
                        icon: 'assets/icons/change_language.svg',
                        text: 'Change phone number',
                      ),
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
                      onTap: () async {
                        FlutterSecureStorage flutterSecureStorage =
                            const FlutterSecureStorage();
                        await flutterSecureStorage.delete(key: 'uid');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Onboarding1View()),
                            (route) => false);
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
  const IconAndTextWidget(
      {super.key, required this.icon, required this.text, required this.color});

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
            color: color,
          ),
        ),
      ],
    );
  }
}

enum UserDataType {
  phone,
  name,
}

class ChangeDataController extends GetView<UserInfoController> {
  final UserDataType type;
  const ChangeDataController({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    return AlertDialog(
      backgroundColor: const Color(0xff2D2D2D).withOpacity(0),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: Container(
          height: 238,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff2D2D2D).withOpacity(0.9),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  ''
                  // controller.translateModel.value.Change_account_name,
                  ,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.87),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width - 64,
                  color: const Color(0xff979797),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: type == UserDataType.phone
                      ? _phoneController
                      : _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText:
                        type == UserDataType.phone ? 'Your phone' : 'Your name',
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide:
                          const BorderSide(color: Color(0xff7A7A7A), width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 52,
                        width: MediaQuery.of(context).size.width / 2 - 52,
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff8875FF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        type == UserDataType.name
                            ? controller.changeName(
                                userModel!.uid, _nameController.text)
                            : controller.changePhone(_phoneController.text);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width: MediaQuery.of(context).size.width / 2 - 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff8875FF),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
