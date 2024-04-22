import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/chat_controller.dart';
import 'package:untitled1/domain/auth_user_domain.dart';

import '../../server_routes.dart';
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
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              },
              child:Stack(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:AssetImage('assets/dwd_logo.jpeg'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0),
                      radius: 25,
                      backgroundImage: NetworkImage('${ServerRoutes.host}/avatar?path=avatar_${userModel!.uid}'),
                      // AssetImage('assets/dwd_logo.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      children: List.generate(controller.chats.length, (index) {
                        final item = controller.chats[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatView(
                                        type: item['type'],
                                        sid: item['sid'],
                                        carIndex: item['type'] == 'car' ? item['sid'] : null,
                                        uidOpponent: item['uid_opponent'],
                                            carId: item['type'] == 'car' ?item['car_ccid'] :null,
                                            chatId: item['cid'],
                                            opponentName: item['type'] == 'car'
                                                ? item['car_name'].toString()
                                                : item['opponent_name']
                                                    .toString(),
                                          )));
                            },
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          item['type'] == 'car'
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    '${ServerRoutes.host}/test_photo?path=${item['car_ccid']}',
                                                  ),
                                                  radius: 32,
                                                )
                                              : Stack(
                                                  children: [
                                                    const Center(
                                                      child: CircleAvatar(
                                                        radius: 32,
                                                        backgroundImage: AssetImage(
                                                            'assets/dwd_logo.jpeg'),
                                                        // AssetImage('assets/dwd_logo.jpeg'),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors
                                                            .white
                                                            .withOpacity(0),
                                                        radius: 32,
                                                        backgroundImage:
                                                             NetworkImage(
                                                                '${ServerRoutes.host}/avatar?path=avatar_${item['uid_opponent']}'),
                                                        // AssetImage('assets/dwd_logo.jpeg'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item['type'] == 'car'
                                                    ? item['car_name']
                                                        .toString()
                                                    : item['opponent_name']
                                                        .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 18,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              item['last_message'] != null
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          item['sender_uid'] ==
                                                                  userModel!.uid
                                                                      .toString()
                                                              ? 'You:'
                                                              : '${item['opponent_name']}:',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff8875FF),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          item['last_message']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16,
                                                              color: Color(
                                                                  0xffffffff)),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              15,
                                                        ),
                                                      ],
                                                    )
                                                  : const Text(
                                                      'No messages',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xffffffff)),
                                                    )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        item['timestamp'] != null
                                            ? item['timestamp']
                                                .toString()
                                                .substring(11, 16)
                                            : '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Color(0xff9C9CA3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color: const Color(0xff9C9CA3),
                                    width: MediaQuery.of(context).size.width,
                                    height: 0.3,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
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
