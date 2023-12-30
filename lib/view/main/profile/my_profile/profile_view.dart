import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/main/profile/my_profile/edit_profile_view.dart';

import '../../../../domain/user/get_user_profile.dart';

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
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileView()));
                },
                    child: Image.asset('assets/design/images/settings.png')),
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
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                              const SizedBox(height: 3,),
                              const Text('Монтажник',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff808080),
                              ),),
                              const SizedBox(height: 8,),
                              const Row(
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
                      userModel.userModel!.skills != 'null' ? const Text('Навыки:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                      ),) : const SizedBox(),
                      userModel.userModel!.skills != 'null' ? Text(userModel.userModel!.skills) : const SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.education != 'null' ? const Text('Образование:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : const SizedBox(),
                      userModel.userModel!.education != 'null' ? Text(userModel.userModel!.education) : const SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.experience != 'null' ? const Text('Опыт:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : const SizedBox(),
                      userModel.userModel!.experience != 'null' ? Text(userModel.userModel!.education) : const SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.about_me != 'null' ? const Text('О себе:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : const SizedBox(),
                      userModel.userModel!.about_me != 'null' ? Text(userModel.userModel!.about_me) : const SizedBox(),
                      const SizedBox(height: 12,),
                      userModel.userModel!.client_visiting != 'null' ? const Text('Выезд к клиенту:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),) : const SizedBox(),
                      userModel.userModel!.client_visiting != 'null' ? Text(userModel.userModel!.client_visiting) : const SizedBox(),
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
                        width: 223,
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
