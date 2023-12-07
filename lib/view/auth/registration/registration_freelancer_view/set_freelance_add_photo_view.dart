import 'package:flutter/material.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelancer_category_1_view.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelancer_send_on_you_view.dart';

class SetFreelancerAddPhotoView extends StatelessWidget {
  String email;
  String password;
  String city;
  String name;
  String date_of_burn;
   SetFreelancerAddPhotoView({super.key, required this.password, required this.email, required this.city, required this.date_of_burn, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/design/images/arrowleft.png'),
                    const Text(
                      'Шаг 1 из 4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/design/images/cross.png'),
                  ],
                ),
                const SizedBox(height: 16,),
                const Text('Добавьте фото в профиль', style: TextStyle(
                  fontSize: 22,
                ),),
                const SizedBox(height: 8,),
                const Text('Пользователям с хорошей фотографией больше доверяют.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
                ),),
                SizedBox(height: MediaQuery.of(context).size.height / 9.3,),
                Center(child: Image.asset('assets/design/images/user.png')),
                const SizedBox(height: 7,),
                const Center(child: Text('Никита', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),)),
                const SizedBox(height: 12,),
                Center(
                  child: Container(
                    height: 40,
                    width: 225,
                    decoration: BoxDecoration(
                      color: const Color(0xffEBEBEB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text("Загрузить фотографию"),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Center(
                  child: Text('Фото можно добавить позже', style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff808080),
                  ),),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 5,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SetFreelancerSendOnYouView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Продолжить', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
