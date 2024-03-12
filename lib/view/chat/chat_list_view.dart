
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

import '../profile/profile_view.dart';
import 'chat_view.dart';

class ChatListView extends GetView<ChatController> {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    controller.getChats(userModel!.uid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'DWD',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xffffffff)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()),
                  );
                },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
              ),),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height - 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: List.generate(controller.chats.length, (index) {
                        final item = controller.chats[index];
                       return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatView(chatId: item['cid'],opponentName: item['opponent_name'].toString(),)));
                        },
                        child: SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset('assets/testsup.png'),
                                  ),
                                  const SizedBox(width: 12,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Support',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                            color: Color(0xffffffff),
                                          ),),
                                          SizedBox(width: MediaQuery.of(context).size.width / 2.4 ,),
                                          const Text('13:37',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Color(0xff9C9CA3),
                                            ),),
                                        ],
                                      ),
                                      const SizedBox(height: 16,),
                                       Row(children: [
                                        const Text('Nadeer:',style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8875FF),
                                        ),),
                                        const SizedBox(width: 3,),
                                        const Text(' Describe the problem',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xffffffff)
                                        ),),
                                        SizedBox(width: MediaQuery.of(context).size.width / 15,),
                                        Container(
                                          height: 16,
                                          width: 16,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              color: const Color(0xff8875FF)
                                          ),
                                          child: const Center(
                                            child: Text('1',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),),
                                          ),
                                        )
                                      ],),

                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Container(color: const Color(0xff9C9CA3),
                              width: MediaQuery.of(context).size.width, height: 0.3,)
                            ],
                          ),
                        ),
                      );}),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}