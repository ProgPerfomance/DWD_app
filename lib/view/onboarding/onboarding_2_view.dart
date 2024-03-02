
import 'package:flutter/material.dart';

import '../welcome_view.dart';
import 'onboarding_3_view.dart';

class Onboarding2View extends StatelessWidget {
  const Onboarding2View({super.key});

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
              Image.asset('assets/merin.png',height: 220),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      color:  Colors.white,
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
              Center(child: Text('Sell a car',
                style: TextStyle(
                  color: const Color(0xffffffff).withOpacity(0.87),
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),)),
              const SizedBox(height: 24,),
              Center(child: Text('Where you can sell you cars with us on the spot for cash or chose to consignment your car with us',textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xffFFFFFF).withOpacity(0.8)
                ),)),
              SizedBox(height: MediaQuery.of(context).size.height / 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text('Back',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff7A7A7A)
                        ),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Onboarding3View()));
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
                            color: Color(0xffffffff),
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
