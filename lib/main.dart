
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/master_view/master_profile.dart';
import 'package:untitled1/meneger_view/meneger_home_view.dart';
import 'package:untitled1/view/onboarding/onboarding_1_view.dart';
import 'domain/auth_user_domain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthUser()),
    ], child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MenegerHomeView(),
    ));
  }

}
