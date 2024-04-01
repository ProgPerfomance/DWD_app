import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';
import '../profile/profile_view.dart';

TextEditingController messageController = TextEditingController();

class ChatView extends GetView<ChatController> {
  final chatId;
  final opponentName;
  final String? message;
  const ChatView({super.key, required this.chatId, required this.opponentName, this.message});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    controller.getChatMessages(chatId);
  message !=null?  messageController.text = message! :'';
    // ScrollController для управления прокруткой
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: Text(
          opponentName,
          style: const TextStyle(
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Obx(() => Column(
                    children:
                        List.generate(controller.messages.length, (index) {
                      final item = controller.messages[index];
                      return Align(
                        alignment: item['uid'] != userModel!.uid.toString()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Padding(
                          padding: item['uid'] == userModel!.uid.toString()
                              ? EdgeInsets.only(
                                  right: 4.0,
                                  top: 3,
                                  bottom: 3,
                                  left: MediaQuery.of(context).size.width / 3.9)
                              : EdgeInsets.only(
                                  left: 4.0,
                                  top: 3,
                                  bottom: 3,
                                  right:
                                      MediaQuery.of(context).size.width / 3.9),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:  item['uid'] != userModel!.uid.toString()
                                  ? const Color(0xff7253F6)
                                  : const Color(0xff252033),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                item['msg_text'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff313132),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
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
                        messageController.text.isNotEmpty
                            ? await controller.sendMessage(
                                cid: chatId,
                                uid: userModel!.uid,
                                msg: messageController.text)
                            : null;
                        messageController.clear();

                        // Прокрутка к последнему сообщению
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent + 130,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xff8875FF),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
