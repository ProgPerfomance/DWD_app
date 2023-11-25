import 'package:flutter/material.dart';
import 'package:untitled1/view/widgets/custom_textfield_widget.dart';
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
class LoginFirstView extends StatelessWidget {
  const LoginFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/design/images/cross.png'),
                  const Text('Вход',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                  const SizedBox(width: 15,),
                ],
              ),
              const SizedBox(height: 20,),
              const Text('Пожалуйста, введите ваш email',style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),),
              const SizedBox(height: 10),
              CustomTextFieldWidget(controller: emailController, text: 'Введите email', password: false,),
              const SizedBox(height: 12,),
              CustomTextFieldWidget(controller: emailController, text: 'Введите пароль', password: true,),
             SizedBox(height: MediaQuery.of(context).size.height / 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginFirstView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Войти', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
