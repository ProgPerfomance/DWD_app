import 'package:flutter/material.dart';
import 'package:untitled1/view/profile/profile_view.dart';
import '../buy_car/car_page_view.dart';

class FavoritCarsView extends StatelessWidget {
  const FavoritCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'DWD',
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
                        builder: (context) => const ProfileView()),
                  );
                },
                child: Image.asset('assets/testava.png')),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 44,
                ),
                SizedBox(
                  height: 1000,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 123),
                    children: List.generate(10, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CarPageView(
                                        liked: '',
                                        transmission: '',
                                        serviceContract: '',
                                        name: '',
                                        price_usd: '',
                                        price_aed: '',
                                        kilometrs: '',
                                        year: '',
                                        body: '',
                                        state: '',
                                        motorsTrim: '',
                                        guarantee: '',
                                        steeringWheel: '',
                                        regionalSpecs: '',
                                        color: '',
                                    id: '0',
                                      )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/testcar.png'),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              '', //      anketss['price'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              '', //  anketss['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              '', //    '${anketss['year']}, ${anketss['kilo']}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xff7A7A7A),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
