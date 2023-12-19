import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(child: Image.asset('assets/design/images/arrowleft.png'),onTap: () {
                      Navigator.pop(context);
                    },),
                    const Text(
                      'Профиль',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                   const SizedBox(width: 13,),
                  ],
                ),
                const SizedBox(height: 16,),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xffD9D9D9),
                ),
                const SizedBox(height: 8,),
                Container(height: 39, width: 194,
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                ),
                  child: const Center(
                    child: Text('Изменить фотографию'),
                  ),
                ),
                const SizedBox(height: 16,),
                EditCardWidget(id: 1, data: '', paramets: 'Ваше имя'),
                EditCardWidget(id: 1, data: '', paramets: 'Ваше имя'),
                EditCardWidget(id: 1, data: '', paramets: 'Ваше имя'),
                EditCardWidget(id: 1, data: '', paramets: 'Ваше имя'),
                EditCardWidget(id: 1, data: '', paramets: 'Ваше имя'),
                SizedBox(height: 12,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class EditCardWidget extends StatelessWidget {
  final id;
  final paramets;
  final data;
  const EditCardWidget({super.key, required this.id, required this.data, required this.paramets});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(paramets, style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff808080),
          ),),
          const SizedBox(height: 12,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(data,style: TextStyle(
                fontSize: 18,
              ),),
              Image.asset('assets/design/images/pencil.png')
            ],),
          const SizedBox(height: 12,),
          Container(height: 1,width: MediaQuery.of(context).size.width - 40,
            color: const Color(0xffEBEBEB),),
        ],
      ),
    );
  }
}
