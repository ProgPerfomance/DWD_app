import 'package:flutter/material.dart';
import 'package:untitled1/view/main/home_view.dart';

class SetFreelancerSuccess extends StatelessWidget {
  const SetFreelancerSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 13,),
              Center(child: Image.asset('assets/design/images/successreg.png')),
              SizedBox(height: MediaQuery.of(context).size.height / 23,),
              const Text('Поздравляем вы стали исполнителем!',style: TextStyle(
                fontSize: 22,
              ), textAlign: TextAlign.center,),
              const SizedBox(height: 12,),
              const Text('Теперь вы можете выполнять заказы',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff808080),
              ),),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width -40,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(child: Text('Искать заказы', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xffFAFAFA),
                    ),),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width -40,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffEBEBEB),
                  ),
                  child: const Center(child: Text('Посмотреть профиль', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff3333333),
                  ),),
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
