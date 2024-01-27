
import 'package:flutter/material.dart';
import 'package:untitled1/view/welcome_view.dart';

import 'onboarding_2_view.dart';

class Onboarding1View extends StatelessWidget {
  const Onboarding1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const WelcomeView()), (route) => false);
                  },
                  child: const Text('Skip', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff7A7A7A),
                  ),),
                ),
              ),
               const SizedBox(height: 48,),
               Image.asset('assets/am_img.png',height: 220,),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 26,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Container(
                    width: 26,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xff7a7a7a),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Container(
                    width: 26,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xff7a7a7a),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12,),
              Center(child: Text('Buy a car',
              style: TextStyle(
                color: const Color(0xffffffff).withOpacity(0.87),
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),)),
              const SizedBox(height: 24,),
              Center(child: Text('You can easily find and buy a perfect car in DWD App',textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xffFFFFFF).withOpacity(0.8)
              ),)),
              SizedBox(height: MediaQuery.of(context).size.height / 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Onboarding2View()));
                    },
                    child: Container(
                      width: 80,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xff8875FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xfffffffff),
                        ),),

                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
