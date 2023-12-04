import 'package:flutter/material.dart';

class ResponseOrderView extends StatelessWidget {
  const ResponseOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/design/images/arrowleft.png'),
                  const Text('Заявка номер 302392921',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),),
                  const SizedBox(height: 20),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Открыто',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff6FC727)
                          ),
                        ),
                        Row(
                          children: [
                            const Text('10',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                              ),
                           ),
                            const SizedBox(width: 3,),
                            Image.asset('assets/design/images/eye.png')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    const Text('Отремонтировать холодильник',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
