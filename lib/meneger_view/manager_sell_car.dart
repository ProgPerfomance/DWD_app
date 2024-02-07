import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'meneger_profile_view.dart';

class ManagerSellCar extends StatelessWidget {
  const ManagerSellCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'Sell a car',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xffffffff)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MenegerProfileView()),
                  );
                },
                child: Image.asset('assets/testava.png')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Applications',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: List.generate(
                    10,
                    (index) => Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/buy.svg'),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Text(
                                      'Year + Brand + Model',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                    'assets/icons/next_manager_purple.svg'),
                              ],
                            ),
                            SizedBox(height: 24,),
                            Divider(height: 0.3,color: Color(0xff1E1E1E),),
                          ],
                        )),
              ),
            ),
            SizedBox(height: 135,),
          ],
        ),
      ),
    );
  }
}
