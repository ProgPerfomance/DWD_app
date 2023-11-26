import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_citys_list.dart';
//import 'package:untitled1/view/auth/registration/registration_%20customer_view/start_registration_%20customer_view.dart';
import 'package:untitled1/view/auth/start_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetCitysList())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartView(),
      ),
    );
  }
}
