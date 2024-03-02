import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

import '../profile/profile_view.dart';

TextEditingController messageController = TextEditingController();

class ChatView extends GetView<ChatController> {
  final chatId;
  const ChatView({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    controller.getChatMessages(chatId);
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
                child: Image.asset('assets/testava.png')),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Obx(
            ()=> SingleChildScrollView(
            child: Column(
              children: List.generate(controller.messages.length, (index) {
                final item = controller.messages[index];
                return Align(
                 alignment:   item['uid'] == userModel!.uid ? Alignment.centerLeft : Alignment.centerRight,

                 child: Container(
                    child: Text(item['msg_text'].toString(),style: TextStyle(
                      color: Colors.white,
                    ),),
                              ),
                );}),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff313132),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: TextField(
            controller: messageController,
            decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                hintText: 'Describe the problem',
                hintStyle: const TextStyle(
                  color: Color(0xff5D5D60),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    await controller.sendMessage(
                        cid: chatId,
                        uid: userModel!.uid,
                        msg: messageController.text);
                    messageController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xff8875FF),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
