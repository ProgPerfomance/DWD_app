// ignore_for_file: prefer_typing_uninitialized_variables, invalid_use_of_protected_member, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/translate_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import 'package:untitled1/controller/get_user_info.dart';
import 'package:untitled1/server_routes.dart';
import 'package:untitled1/translate/eng_model.dart';
import 'package:untitled1/translate/ru_model.dart';
import 'package:untitled1/view/onboarding/onboarding_1_view.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'car_list_view.dart';
import 'farorit_cars_view.dart';
ImageProvider getImageProvider(bool hasImage, String imagePath) {
  if (hasImage) {
    return NetworkImage('${ServerRoutes.host}/avatar?path=$imagePath');
  } else {
    return const AssetImage('assets/dwd_logo.jpeg');
  }
}
ImageProvider imageProvider = getImageProvider(true, 'avatar_3');
TextEditingController _nameController = TextEditingController();

class ProfileView extends GetView<UserInfoController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    controller.getUserInfo(userModel!.uid);
    _nameController.text = userModel!.name;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            controller.translateModel.value.Profile,
            style: const TextStyle(
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
                Stack(
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage:AssetImage('assets/dwd_logo.jpeg'),
                        // AssetImage('assets/dwd_logo.jpeg'),
                      ),
                    ),
                     Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0),
                        radius: 45,
                        backgroundImage: NetworkImage('${ServerRoutes.host}/avatar?path=avatar_${userModel!.uid}'),
                        // AssetImage('assets/dwd_logo.jpeg'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    controller.user.value['name']
                        .toString(), //  user.userModel!.name,
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
                userModel!.rules == 1
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FavoritCarsView()));
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 2 - 47,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xff363636),
                              ),
                              child: Center(
                                child: Text(
                                  controller.translateModel.value.WISHLIST,
                                  style: const TextStyle(
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
                                      builder: (context) =>
                                          const CarListView()));
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xff8875FF),
                              ),
                              child: Center(
                                child: Text(
                                  controller.translateModel.value.MY_CARS,
                                  style: const TextStyle(
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
                      Text(
                        controller.translateModel.value.Settings,
                        style: const TextStyle(
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
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      const Color(0xff2D2D2D).withOpacity(0),
                                  contentPadding: EdgeInsets.zero,
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  content: Container(
                                      height: 238,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xff2D2D2D)
                                            .withOpacity(0.9),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Center(
                                            child: Text(
                                              controller.translateModel.value.Change_account_name,
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.87),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  64,
                                              color: const Color(0xff979797),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: TextField(
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                              controller: _nameController,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0xff1D1D1D),
                                                hintStyle: const TextStyle(
                                                  color: Color(
                                                    0xff535353,
                                                  ),
                                                ),
                                                hintText: 'Your name',
                                                isDense: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff7A7A7A),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12,
                                                  ),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff7A7A7A),
                                                      width: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: SizedBox(
                                                    height: 52,
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            52,
                                                    child: const Center(
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xff8875FF),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.changeName(
                                                        userModel!.uid,
                                                        _nameController.text);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            52,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: const Color(
                                                          0xff8875FF),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                              });
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/change_name.svg',
                          text: controller
                              .translateModel.value.Change_account_name,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          //      Get.bottomSheet(Container());
                        },
                        child: GestureDetector(
                          onTap: () {
                            _main();
                          },
                          child: IconAndTextWidget(
                            icon: 'assets/icons/change_photo.svg',
                            text: controller
                                .translateModel.value.Change_account_Image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(Container(
                            height: 230,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff363636).withOpacity(0.8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                const Center(
                                  child: Text(
                                    'Change app Language',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Center(
                                  child: Container(
                                    height: 1,
                                    width:
                                        MediaQuery.of(context).size.width - 48,
                                    color: const Color(0xff7A7A7A),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextButton(
                                    onPressed: () {
                                      controller.changeLaunguage(ruModel);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Russian')),
                                TextButton(
                                    onPressed: () {
                                      controller.changeLaunguage(engModel);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('English')),
                              ],
                            ),
                          ));
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/change_language.svg',
                          text: controller
                              .translateModel.value.Change_app_language,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      IconAndTextWidget(
                        icon: 'assets/icons/delete_account.svg',
                        text: controller.translateModel.value.Delete_account,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        controller.translateModel.value.Information,
                        style: const TextStyle(
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
                          launchUrl(
                              url); //https://www.facebook.com/DubaiWD/about
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/about_ass.svg',
                          text: controller.translateModel.value.About_us,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          var url = Uri.parse(
                              'https://www.facebook.com/DubaiWD/about'); //info@dubaiwd.com
                          launchUrl(url); //
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/faqsvg.svg',
                          text: controller.translateModel.value.FAQ,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          var url = Uri.parse(
                              'https://info@dubaiwd.com'); //info@dubaiwd.com
                          launchUrl(url); //
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/help_feedback.svg',
                          text: controller.translateModel.value.Help_Feedback,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      IconAndTextWidget(
                        icon: 'assets/icons/support_us.svg',
                        text: controller.translateModel.value.Support_US,
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
                                  builder: (context) =>
                                      const Onboarding1View()),
                              (route) => false);
                        },
                        child: IconAndTextWidget(
                          icon: 'assets/icons/meneger_logout.svg',
                          text: controller.translateModel.value.Log_out,
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
      ),
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  final icon;
  final text;
  Color? color;
  IconAndTextWidget(
      {super.key, required this.icon, required this.text, this.color});

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
      ],
    );
  }
}

Future<void> uploadImage(File imageFile) async {
  var url = Uri.parse('${ServerRoutes.host}/add_avatar');

  List<int> imageBytes = imageFile.readAsBytesSync();
  String base64Image = base64Encode(imageBytes);

  var requestBody = jsonEncode({'image': {'data': base64Image, 'name': 'avatar_${userModel!.uid}.jpg'}});

  var response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: requestBody,
  );

  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Failed to upload image');
  }
}

void _main() async {
  // Example usage of ImagePicker to get an image file
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);

    await uploadImage(imageFile);
  }}