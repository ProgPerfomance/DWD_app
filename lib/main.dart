import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controller/send_for_user_controller.dart';
import 'package:untitled1/domain/ads/create_adverb.dart';
import 'package:untitled1/domain/chat/create_chat.dart';
import 'package:untitled1/domain/chat/get_chat_messages.dart';
import 'package:untitled1/domain/chat/get_user_chats.dart';
import 'package:untitled1/domain/chat/send_message.dart';
import 'package:untitled1/domain/order/create_order.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/domain/get_citys_list.dart';
import 'package:untitled1/domain/order/get_order_from_id.dart';
import 'package:untitled1/domain/order/get_orders_from_cat.dart';
import 'package:untitled1/domain/order/get_orders_list.dart';
import 'package:untitled1/domain/response_from_order.dart';
import 'package:untitled1/domain/user/get_user_profile.dart';
import 'package:untitled1/view/auth/start_screen.dart';
import 'domain/user/auth/create_user.dart';
import 'package:untitled1/domain/get_catigories.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SendForUserController()),
        ChangeNotifierProvider(create: (context) => GetOrdersFromCategory()),
        ChangeNotifierProvider(create: (context) => GetUserChats()),
        ChangeNotifierProvider(create: (context) => SendMessage()),
        ChangeNotifierProvider(create: (context) => GetChatMessages()),
        ChangeNotifierProvider(create: (context) => GetUserProfile()),
        ChangeNotifierProvider(create: (context) => CreateChat()),
        ChangeNotifierProvider(create: (context) => CreateUser()),
        ChangeNotifierProvider(create: (context) => GetCitysList()),
        ChangeNotifierProvider(create: (context) => ResponseFromOrder()),
        ChangeNotifierProvider(create: (context) => GetOrderFromId()),
        ChangeNotifierProvider(create: (context) => GetCategoriesList()),
        ChangeNotifierProvider(create: (context) => GetOrdersList()),
        ChangeNotifierProvider(create: (context) => CreateOrder()),
        ChangeNotifierProvider(create: (context) => GetCatigories()),
        ChangeNotifierProvider(create: (context) => CreateAdverb()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: StartCreateOrder(),
        home: StartView(),
      ),
    );
  }
}
