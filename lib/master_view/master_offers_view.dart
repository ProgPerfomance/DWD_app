import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/controller/services_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';


import '../view/profile/profile_view.dart';

class MasterOffersView extends GetView<ServicesController>{
  const MasterOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getMyOffers(garage: userModel!.uid);
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
      body:SizedBox(
          child:
            Obx(
              ()=> Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.count(
                    primary: false,
                    //   padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 80),
                    children:
                     List.generate(controller.myOffers.length+1, (index) {
                     return  index == 0?
                         Center(
                       child: Container(height: 140,width: 150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: const Color(0xff2F2F2F),
                           border: Border.all(
                             color: const Color(0xff8875FF)
                           )),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             SvgPicture.asset('assets/icons/new_offer.svg'),
                             const SizedBox(height: 8,),
                             const Text('New Offer',
                             style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w400,
                               color: Color(0xff8875FF),
                             ),),
                           ],
                         ),
                       ),
                     ):const Text('');
                     }),
                    ),
              ),
            ),

      ),
    );
  }
}
