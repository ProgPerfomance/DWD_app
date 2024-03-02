import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/meneger_view/manager_sell_car.dart';
import 'package:untitled1/meneger_view/manager_servises_view.dart';
import 'package:untitled1/meneger_view/meneger_booking_view.dart';
import 'package:untitled1/meneger_view/meneger_catalog_view.dart';
import 'package:untitled1/view/chat/chat_list_view.dart';


List screens = [
  const MenegerCarCatalogView(),
  const ManagerSellCar(),
  const ManagerServiceView(),
  const ChatListView(),
  const BookingManagerView(),
];
int selectedScreen = 0;

class MenegerHomeView extends StatefulWidget {
  const MenegerHomeView({super.key});

  @override
  State<MenegerHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MenegerHomeView> {
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
                                'assets/icons/buy.svg',
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
                                'Catalog',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: selectedScreen == 0
                                      ? const Color(0xff8875FF)
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            selectedScreen = 1;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/sell.svg',
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
                                'Requests',
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
                      GestureDetector(
                          onTap: () {
                            selectedScreen = 2;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/service.svg',
                                height: 24,
                                width: 24,
                                color: selectedScreen == 2
                                    ? const Color(0xff8875FF)
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 5.3,
                              ),
                              Text(
                                'Service',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: selectedScreen == 2
                                      ? const Color(0xff8875FF)
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            selectedScreen = 3;
                            setState(() {});
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/chat.svg',
                                height: 24,
                                width: 24,
                                color: selectedScreen == 3
                                    ? const Color(0xff8875FF)
                                    : Colors.white,
                              ),
                              const SizedBox(
                                height: 5.3,
                              ),
                              Text(
                                '  Chat  ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: selectedScreen == 3
                                      ? const Color(0xff8875FF)
                                      : Colors.white,
                                ),
                              ),
                            ],
                          )),
                      GestureDetector(
                        onTap: () {
                          selectedScreen = 4;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/booking.svg',
                              height: 24,
                              width: 24,
                              color: selectedScreen == 4
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
                                color: selectedScreen == 4
                                    ? const Color(0xff8875FF)
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
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
