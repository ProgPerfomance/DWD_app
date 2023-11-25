import 'package:flutter/material.dart';
import 'package:untitled1/view/auth/registration/registration_%20customer_view/registration_customer_first_view.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/registration_freelancer_first_view.dart';

class SelectRegTypeView extends StatelessWidget {
  const SelectRegTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/design/images/logo.png'),
              Image.asset('assets/design/images/registr.png'),
              SizedBox(height: MediaQuery.of(context).size.height / 23,),
              const Text('Как хотите\nзарегистрироваться?', style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height / 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationFreelancerFirstView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Как исполнитель', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 79,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationCustomerFirstView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff333333),
                    ),
                    child: const Center(
                      child: Text('Как заказчик', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
