import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/user/get_user_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final  userModel = context.watch<GetUserProfile>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                Image.asset('assets/design/images/settings.png'),
              ],
          ),
            ),
              const SizedBox(height: 12,),
              Container(decoration:  BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(12),
              ),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                          ),child: Image.asset('assets/design/images/testava.png', height: 129, width: 104),),
                       const SizedBox(width: 16,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userModel.userModel!.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                              SizedBox(height: 3,),
                              Text('Монтажник',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff808080),
                              ),),
                              SizedBox(height: 8,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 24,
                                  ),
                                  Text('4.9',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Container(height: 1,color: const Color(0xffCBCBCB),
                      width: MediaQuery.of(context).size.width -40,),
                      const SizedBox(height: 16,),
                      userModel.userModel!.skills != null ? Text('Навыки:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                      ),) : SizedBox(),
                      userModel.userModel!.skills != null ? Text(userModel.userModel!.skills) : SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.education != null ? Text('Образование:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : SizedBox(),
                      userModel.userModel!.education != null ? Text(userModel.userModel!.education) : SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.experience != null ? Text('Опыт:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : SizedBox(),
                      userModel.userModel!.experience != null ? Text(userModel.userModel!.education) : SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.about_me != null ? Text('О себе:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : SizedBox(),
                      userModel.userModel!.about_me != null ? Text(userModel.userModel!.about_me) : SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.client_visiting != null ? Text('Выезд к клиенту:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : SizedBox(),
                      userModel.userModel!.client_visiting != null ? Text(userModel.userModel!.client_visiting) : SizedBox(),
                      const SizedBox(height: 12,),
                      const Text('Услуги и цены:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Монтажка'),
                          Text('от 1000\$'),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        height: 33,
                        width: 194,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(46),
                          color: const Color(0xffEBEBEB)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Смотреть все услуги и цены',
                            style: TextStyle(
                              fontSize: 12,
                            ),),
                            Image.asset('assets/design/images/arrowright.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 52,
                  width: MediaQuery.of(context).size.width - 40,
                  child: const Center(child: Text('Удалить профиль',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),)),
                ),
              ),
              const SizedBox(height: 12,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 52,
                  width: MediaQuery.of(context).size.width - 40,
                  child: const Center(child: Text('Выйти', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
