import 'package:flutter/material.dart';

import 'auth/login/login_view.dart';
import 'auth/registration/registration_view.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Column(
             children: [
               SizedBox(height: MediaQuery.of(context).size.height / 7,),
               const Text('Welcome to DWD',
               style: TextStyle(
                 color: Color(0xffffffff),
                 fontSize: 32,
                 fontWeight: FontWeight.w900,
               ),),
                const SizedBox(height: 24,),
                Text('Please login to your account or create new account to continue',
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.w400,
                 fontSize: 16,
                 color: const Color(0xffffffff).withOpacity(0.7)
               ),),
               SizedBox(height: MediaQuery.of(context).size.height / 2.3,),
               GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                 },
                 child: Container(
                   height: 52,
                   width: MediaQuery.of(context).size.width - 32,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: const Color(0xff8875FF)
                   ),
                   child: const Center(
                     child: Text('Login',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Color(0xffffffff)
                     ),),
                   ),
                 ),
               ),
               const SizedBox(height: 12,),
               GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationView()));
                 },
                 child: Container(
                   height: 52,
                   width: MediaQuery.of(context).size.width - 32,
                   decoration: BoxDecoration(
                     border: Border.all(color: const Color(0xff8875FF)),
                       borderRadius: BorderRadius.circular(8),
                     //  color: const Color(0xff8875FF)
                   ),
                   child: const Center(
                     child: Text('Create account',
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.w400,
                           color: Color(0xffffffff)
                       ),),
                   ),
                 ),
               )
             ],
           ),
         ),
       ),
    );
  }
}
