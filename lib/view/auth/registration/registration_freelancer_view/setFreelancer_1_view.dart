import 'package:flutter/material.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/citys_list_screen.dart';

class SetFreelancer1view extends StatelessWidget {
  const SetFreelancer1view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Стать исполнителем',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset('assets/design/images/cross.png'),
                ],
              ),
              const SizedBox(height: 9,),
              const Text('Как вас представлять заказчикам?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 8,),
              const Text('Чтобы заказчики доверяли вам, укажите достоверную информацию.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff808080)
              ),),
              const SizedBox(height: 24,),
              const Text('Ваше ФИО', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
              ),),
              const TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: 'ФИО',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )
                ),
              ),
              const SizedBox(height: 12,),
              const Text('Ваш Город', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff808080),
              ),),
              const SizedBox(height: 12,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CitysListView()));
                    },
                    child: const Text('Москва',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  Image.asset('assets/design/images/arrowright.png'),
                ],
              ),
             const SizedBox(height: 10,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 20,
                color: const Color(0xff808080),
              ),
              const SizedBox(height: 10,),
              const TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    hintText: 'Дата рождения',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff808080),
                    )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /3,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SetFreelancer1view()));
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
    );
  }
}
//в день когда мы расстались я вытягивал исходники на 400гб с индусских серверов общей стоимостью n тысяч в день.
// Ты понимаешь чего мне это стоило, пару часиков посидеть чай попить, если хочешь покажу как это делается.
// А безопасность там весьма хорошая