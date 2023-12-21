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
    timer(widget.cid);
    getMessagesModel.getChatMessages(widget.cid);
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(getMessagesModel.messages.length, (index) {
              MessageModel msg = getMessagesModel.messages[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: msg.uid == userModel.uid ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: msg.uid == userModel.uid ? const Color(0xffEBEBEB).withOpacity(0.7) : const Color(0xffF0F2F5),
                    ),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(msg.msg_text),
                    ),),
                  ],
                ),
              );}),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: Border.symmetric(vertical: BorderSide(color: Colors.black, width: 0.5), horizontal: BorderSide(color: Colors.black,width: 0.5),),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: messageController,
            onSubmitted: (value) {
              messageModel.sendMessage(cid: widget.cid, uid: userModel.uid, msg: messageController.text);

            },
          ),
        ),
      ),
    );
  }
  void timer(cid) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      GetChatMessages().getChatMessages(cid);
      setState(() {
      });
    });
  }
}


