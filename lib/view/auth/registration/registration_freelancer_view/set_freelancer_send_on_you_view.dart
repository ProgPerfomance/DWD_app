import 'package:flutter/material.dart';

class SetFreelancerSendOnYouView extends StatelessWidget {
  const SetFreelancerSendOnYouView({super.key});

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
                      'Шаг 3 из 4',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('assets/design/images/cross.png'),
                  ],
                ),
                const SizedBox(height: 16,),
                const Text('Расскажите о себе' , style: TextStyle(
                  fontSize: 22,
                ),),
                const SizedBox(height: 8,),
                const Text('Напишите почему стоит выбрать именно вас.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff808080),
                  ),),
                const SizedBox(height: 12,),
               const SendForYouCard(text: 'Навыки'),
                const SendForYouCard(text: 'Образование'),
                const SendForYouCard(text: 'Опыт'),
                const SendForYouCard(text: 'О себе'),
                const SendForYouCard(text: 'Выезд к клиенту'),
                SizedBox(height: MediaQuery.of(context).size.height / 2.73,),
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


class SendForYouCard extends StatelessWidget {
  final String text;
  const SendForYouCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(text, style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xff808080),
            ),),
            Image.asset('assets/design/images/arrowright.png'),
          ],),
        const SizedBox(height: 12,),
        Container(
          height: 1,
          color: const Color(0xffEBEBEB),
          width: MediaQuery.of(context).size.width - 40,
        ),
        const SizedBox(height: 12,),
      ],
    );
  }
}
