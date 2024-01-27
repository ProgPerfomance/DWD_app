import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/master_view/booking_master_view.dart';
import 'package:untitled1/master_view/master_profile.dart';
import 'package:untitled1/view/booking/booking_list_view.dart';
import 'package:untitled1/view/chat/chat_list_view.dart';
import 'package:untitled1/view/sell_car_view/sell_car_view.dart';
import 'package:untitled1/view/servise/servise_view.dart';

List screens = [
  const BookingMasterView(),
  const ChatListView(),
];
int selectedScreen = 0;

class MasterHomeView extends StatefulWidget {
  const MasterHomeView({super.key});

  @override
  State<MasterHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MasterHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screens[selectedScreen],
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff363636).withOpacity(0.93),
              child: Column(
                children: [
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectedScreen = 0;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/booking.svg',
                              height: 24,
                              width: 24,
                              color: selectedScreen == 0
                                  ? const Color(0xff8875FF)
                                  : Colors.white,
                            ),
                            const SizedBox(
                              height: 5.3,
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: selectedScreen == 0
                                    ? const Color(0xff8875FF)
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            selectedScreen = 1;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/chat.svg',
                                height: 24,
                                width: 24,
                                color: selectedScreen == 1
                                    ? const Color(0xff8875FF)
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 5.3,
                              ),
                              Text(
                                'Chat',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: selectedScreen == 1
                                      ? const Color(0xff8875FF)
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
