
import 'package:flutter/material.dart';
import 'package:untitled1/meneger_view/manager_servises.dart';

import '../view/servise/servise_view.dart';
import 'meneger_profile_view.dart';
import 'models/all_service_icons_model.dart';
import 'models/all_service_text_model.dart';
import 'models/special_offers_models.dart';


class ManagerServiceView extends StatefulWidget {
  const ManagerServiceView({super.key});

  @override
  State<ManagerServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ManagerServiceView> {
  final middleLeadingStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  final bigLeadingStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xff8875FF));
  final firstBigLeadingStyle = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white);
  final smallLeadingStyle =
      const TextStyle(fontSize: 13, color: Color(0xff7A7A7A));
  final firstSmallLeadingStyle =
      const TextStyle(fontSize: 13, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
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
                        builder: (context) => const MenegerProfileView()),
                  );
                },
                child: const Text('All garages',style: TextStyle(color: Color(0xff8875FF)),)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, bottom: 35),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Row(
                        children: [
                          Text("Special offers", style: middleLeadingStyle),
                        ],
                      ),
                    ),
                    Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                spacing: 16,
                                children: List.generate(
                                  nameMajorService.length,
                                  (index) => SizedBox(
                                      height: 140,
                                      width: 150,
                                      child: ElevatedButton(
                                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralRepairView())),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    index == 0
                                                        ? Colors.green
                                                        : Colors.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Wrap(
                                                  direction: Axis.vertical,
                                                  spacing: 4,
                                                  children: [
                                                    Text(
                                                      nameMajorService[index],
                                                      style: index == 0
                                                          ? firstBigLeadingStyle
                                                          : bigLeadingStyle,
                                                    ),
                                                    Text(
                                                      newMajorService[index],
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      lastMajorService[index],
                                                      style: index == 0
                                                          ? firstSmallLeadingStyle
                                                          : smallLeadingStyle,
                                                    )
                                                  ],
                                                )),
                                          ))),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'All service',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServiceButton(
                          text: 'General\nrepair',
                          icon: 'assets/icons/general_repair.svg',
                          id: 0,
                        ),
                        ServiceButton(
                          text: 'Interval\nservice',
                          icon: 'assets/icons/interval_service.svg',
                          id: 1,
                        ),
                        ServiceButton(
                          text: 'Gearbox\nrepair',
                          icon: 'assets/icons/gearbox.svg',
                          id: 2,
                        ),
                        ServiceButton(
                          text: 'Wheels',
                          icon: 'assets/icons/general2.svg',
                          id: 3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ), //  text: 'General\nrepair','Interval\nservice', 'Gearbox\nrepair','Wheels','Brakes','Battery', 'AC repair', 'Wrapping &\nPPF',   text: 'Tinting', text: 'Detailing',
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServiceButton(
                          text: 'Brakes',
                          icon: 'assets/icons/brakes.svg',
                          id: 4,
                        ),
                        ServiceButton(
                          text: 'Battery',
                          icon: 'assets/icons/battary.svg',
                          id: 5,
                        ),
                        ServiceButton(
                          text: 'AC repair',
                          icon: 'assets/icons/ac.svg',
                          id: 6,
                        ),
                        ServiceButton(
                          text: 'Wrapping &\nPPF',
                          icon: 'assets/icons/ppf.svg',
                          id: 7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ServiceButton(
                          text: 'Tinting',
                          icon: 'assets/icons/tinting.svg',
                          id: 8,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        ServiceButton(
                          text: 'Detailing',
                          icon: 'assets/icons/detaling.svg',
                          id: 9,
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
    );
  }
}
