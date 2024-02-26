import 'package:flutter/material.dart';

class ManagerSellCarInfo extends StatelessWidget {
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? carName;
  final String? year;
  final String? model;
  final String? brand;
  const ManagerSellCarInfo(
      {super.key,
      required this.year,
      required this.ownerEmail,
      required this.ownerName,
      required this.model,
      required this.brand,
      required this.carName,
      required this.ownerPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff8875FF),
                        ),
                      ),
                    ),
                    const Text(
                      'My cars',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Text('Client details'),
              Text(ownerName.toString()),
              Text(ownerPhone.toString()),
              Text(ownerEmail.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
