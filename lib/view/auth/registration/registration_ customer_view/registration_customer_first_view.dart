import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:untitled1/view/auth/registration/registration_%20customer_view/registration_customer_second_screen.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';

import '../../../../domain/user/auth/create_user.dart';

TextEditingController nameController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class RegistrationCustomerFirstView extends StatelessWidget {
  const RegistrationCustomerFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    final createUserModel = context.read<CreateUser>();
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
                    Image.asset('assets/design/images/cross.png'),
                    const Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(height: 24,),
                const Text(
                  'Пожалуйста, введите ваши данные',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: nameController, text: 'Введите Имя', password: false),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: cityController, text: 'Введите Город', password: false),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: emailController, text: 'Введите email', password: false),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: passwordController, text: 'Введите пароль', password: true),
                const SizedBox(height: 16,),
                RichText(
                  text: TextSpan(
                    text: 'Используя приложение, вы соглашаетесь \n с  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF333333),
                    ),
                    children: <InlineSpan>[
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Column(
                            children: <Widget>[
                              Text(
                                'Политикой конфиденциальности',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  height: 1.1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(
                                    0xFFF14F44,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: () async {
                  await createUserModel.createUser(name: nameController.text,  email: emailController.text, age: null, freelancer: false, last_login: DateTime.now().toString(), password_hash: passwordController.text, city: cityController.text, country: null, date_of_burn: null, avatar: null, spheres: null, skills: null, education: null, experience: null, about_me: null, client_visiting: null, servises: null, rating: null, reviews: null, email_succes: true);
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationCustomerSecondScreen()));
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
