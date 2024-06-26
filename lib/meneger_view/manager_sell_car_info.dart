import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../view/buy_car/car_page_view.dart';

class ManagerSellCarInfo extends StatelessWidget {
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;
  final String? carName;
  final String? year;
  final String? model;
  final String? brand;
  final String? regNumber;
  final String? type;
  final String? timestamp;
  const ManagerSellCarInfo({
    super.key,
    required this.year,
    required this.ownerEmail,
    required this.ownerName,
    required this.model,
    required this.brand,
    required this.carName,
    required this.ownerPhone,
    required this.regNumber,
    required this.type,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        title: Text(
          type == '1' ? 'Sell on the spot' : 'Consignment',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Client details',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/person.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ownerName.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/phone.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      callNumber(ownerPhone.toString());
                    },
                    child: Text(
                      ownerPhone.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/email.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(ownerEmail.toString(), style: _style),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/car.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: $carName',
                        style: _style,
                      ),
                      Text(
                        'Brand: $brand',
                        style: _style,
                      ),
                      Text(
                        'Model: $model',
                        style: _style,
                      ),
                      Text(
                        'Year: $year',
                        style: _style,
                      ),
                      Text(
                        'Reg number: $regNumber',
                        style: _style,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Text('Date: ${timestamp.toString().substring(0,10)}',style: _style,),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _style = const TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
