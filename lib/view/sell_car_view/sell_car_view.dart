import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/view/sell_car_view/sell_on_the_spot_view.dart';

import '../profile/profile_view.dart';
import 'consignment_view.dart';

class SellCarView extends StatelessWidget {
  const SellCarView({super.key});

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
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              const SellCarBanner(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff363636),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Consignment',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff8875FF),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'We sell your car on your behalf, against a fixed fee and we handle every aspect of the sale on your behalf, listing, documentation, viewing and detailing if needed',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 52,
                              width: MediaQuery.of(context).size.width / 2 - 28,
                              child: const Center(
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8687E7),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ConsignmentView()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff8875FF),
                                ),
                                height: 52,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 28,
                                child: const Center(
                                  child: Text(
                                    'Consignment',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff363636),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sell on the spot',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff8875FF),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'We will evaluate your car and offer the best price, we pay you direct and in cash on the spot',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 52,
                              width: MediaQuery.of(context).size.width / 2 - 28,
                              child: const Center(
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff8687E7),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SellOnTheSpotView()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff8875FF),
                                ),
                                height: 52,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 28,
                                child: const Center(
                                  child: Text(
                                    'Sell on the spot',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48,),
            ],
          ),
        ),
      ),
    );
  }
}

class SellCarBanner extends StatelessWidget {
  const SellCarBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff121212),
        Color(0xff8875FF),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          const Center(
              child: Text(
            'Sell any car in Dubai, UAE -\nLet us take over, and sell\nyour car!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          )),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset('assets/1_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Transparency',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'We price your car\naccurately, avoiding\nfake offers and fake\nadverts.',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/2_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Safety',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'We ensure legal\ntransactions and full\npayments,\nprotecting you from\nfraud.',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset('assets/3_sellb.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Trust',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'We secure the best\noffer for your car\nand provide 24/7\nafter-sale support.',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
