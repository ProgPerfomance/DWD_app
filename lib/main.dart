import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/create_order.dart';
import 'package:untitled1/domain/get_categories_list.dart';
import 'package:untitled1/domain/get_citys_list.dart';
import 'package:untitled1/domain/get_orders_list.dart';
import 'package:untitled1/view/auth/start_screen.dart';
import 'package:untitled1/view/main/home_view.dart';
import 'package:untitled1/view/main/response_order_view.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetCitysList()),
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
