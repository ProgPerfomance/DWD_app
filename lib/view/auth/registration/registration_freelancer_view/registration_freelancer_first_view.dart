import 'package:flutter/material.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/registration_freelancer_second_screen.dart';

import '../../../widgets/custom_textfield_widget.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class RegistrationFreelancerFirstView extends StatelessWidget {
  const RegistrationFreelancerFirstView({super.key});

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
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationFreelancerSecondScreen()));
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
