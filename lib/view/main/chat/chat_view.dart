import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/chat/get_chat_messages.dart';
import 'package:untitled1/domain/chat/send_message.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/model/message_model.dart';

TextEditingController messageController = TextEditingController();

class ChatView extends StatefulWidget {
  final cid;
  const ChatView({super.key, required this.cid});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    final messageModel = context.read<SendMessage>();
    final userModel = context.read<CreateUser>();
    final getMessagesModel = context.read<GetChatMessages>();
    getMessagesModel.getChatMessages(widget.cid);
    Future.delayed(const Duration(milliseconds: 30), () {
      setState(() {

      });
    });
    return WillPopScope(
        onWillPop: () {
      Navigator.pop(context);
      time.cancel();
      GetChatMessages().clearList();
      setState(() {
      });
      return Future.value(false);
    },
      child: Scaffold(
        appBar: AppBar(
        ),
        backgroundColor: const Color(0xffFAFAFA),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 185,
                child: SingleChildScrollView(
                  child: Column(
                    children:
                        List.generate(getMessagesModel.messages.length, (index) {
                      MessageModel msg = getMessagesModel.messages[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: msg.uid == userModel.uid
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: msg.uid == userModel.uid
                                    ? const Color(0xffEBEBEB).withOpacity(0.7)
                                    : const Color(0xffF0F2F5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(msg.msg_text),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          messageModel.sendMessage(
                              cid: widget.cid,
                              uid: userModel.uid,
                              msg: messageController.text);
                          messageController.clear();
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    GetChatMessages().getChatMessages(widget.cid);
   timer(widget.cid);
    super.initState();
  }
  var time =Timer.periodic(const Duration(seconds: 5), (timer) {});
  void timer(cid) {
   time  = Timer.periodic(const Duration(seconds: 5), (timer) {
      GetChatMessages().getChatMessages(cid);
      setState(() {});
    });
  }
  @override
  void dispose() {
    time.cancel();
    GetChatMessages().messages.clear();
    setState(() {
    });
    super.dispose();

  }
}
