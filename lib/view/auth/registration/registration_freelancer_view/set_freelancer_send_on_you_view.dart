// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controller/send_for_user_controller.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/domain/user/get_user_profile.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/edit_send_for_you_form_view.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelancer_success.dart';

class SetFreelancerSendOnYouView extends StatelessWidget {
  String email;
  String password;
  String city;
  String name;
  String date_of_burn;
  var photo;
  SetFreelancerSendOnYouView(
      {super.key,
      required this.name,
      required this.password,
      required this.date_of_burn,
      required this.city,
      required this.email,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    final infoModel = context.watch<SendForUserController>();
    final createUserModel = context.read<CreateUser>();
    final getUserDataModel = context.read<GetUserProfile>();
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
                      'Шаг 3 из 4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/design/images/cross.png'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Расскажите о себе',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Напишите почему стоит выбрать именно вас.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff808080),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SendForYouCard(
                  text: 'Навыки',
                  id: 1,
                ),
                const SendForYouCard(
                  text: 'Образование',
                  id: 2,
                ),
                const SendForYouCard(
                  text: 'Опыт',
                  id: 3,
                ),
                const SendForYouCard(
                  text: 'О себе',
                  id: 4,
                ),
                const SendForYouCard(
                  text: 'Выезд к клиенту',
                  id: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.73,
                ),
                GestureDetector(
                  onTap: () async {
             int uid = await     createUserModel.createUser(
                        name: name,
                        email: email,
                        age: null,
                        freelancer: true,
                        last_login: DateTime.now().toString(),
                        password_hash: password,
                        city: city,
                        country: 'Russia',
                        date_of_burn: date_of_burn,
                        avatar: null,
                        spheres: null,
                        skills: infoModel.skills,
                        education: infoModel.education,
                        experience: infoModel.experience,
                        about_me: infoModel.about_me,
                        client_visiting: infoModel.client_visiting,
                        servises: null,
                        rating: 5,
                        reviews: null,
                        email_succes: true);
                    getUserDataModel.getUserProfile(uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SetFreelancerSuccess()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Продолжить',
                          style: TextStyle(
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

class SendForYouCard extends StatelessWidget {
  final String text;
  final int id;
  const SendForYouCard({super.key, required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditSendForYouFormView(
                      name: text,
                      nameView: text,
                      id: id,
                    )));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xff808080),
                ),
              ),
              Image.asset('assets/design/images/arrowright.png'),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 1,
            color: const Color(0xffEBEBEB),
            width: MediaQuery.of(context).size.width - 40,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
