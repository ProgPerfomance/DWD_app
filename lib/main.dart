import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_order.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/domain/get_citys_list.dart';
import 'package:untitled1/domain/get_order_from_id.dart';
import 'package:untitled1/domain/get_orders_list.dart';
import 'package:untitled1/domain/response_from_order.dart';
import 'package:untitled1/domain/user/get_user_profile.dart';
import 'package:untitled1/view/auth/start_screen.dart';

import 'domain/user/auth/auth_user.dart';
import 'domain/user/auth/create_user.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetUserProfile()),
        ChangeNotifierProvider(create: (context) => AuthUserFromEmail()),
        ChangeNotifierProvider(create: (context) => CreateUser()),
        ChangeNotifierProvider(create: (context) => GetCitysList()),
        ChangeNotifierProvider(create: (context) => ResponseFromOrder()),
        ChangeNotifierProvider(create: (context) => GetOrderFromId()),
        ChangeNotifierProvider(create: (context) => GetCategoriesList()),
        ChangeNotifierProvider(create: (context) => GetOrdersList()),
        ChangeNotifierProvider(create: (context) => CreateOrder())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartView(),
      ),
    );
  }
}
