import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/chat/get_user_chats.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/view/main/chat/chat_view.dart';

import '../../../domain/chat/get_chat_messages.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatsModel = context.read<GetUserChats>();
    final userModel = context.read<CreateUser>();
    chatsModel.getUserChats(userModel.uid);
    print(chatsModel.chats);
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Image.asset('assets/design/images/arrowleft.png'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Чаты',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Ваши диалоги',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                        chatsModel.chats.length,
                        (index) {
                          var data = chatsModel.chats[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: GestureDetector(
                                onTap: () async {
                                 await GetChatMessages().getChatMessages(data.cid);

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatView(cid: data.cid,)));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: const Color(0xffffffff),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 32,
                                        ),
                                        const SizedBox(width: 14),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.subject_name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              data.oponent_name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              data.last_message.toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff808080),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );}),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
