import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:untitled1/meneger_view/manager_services/all_garages.dart';
import 'package:untitled1/meneger_view/manager_services/manager_servises.dart';
import '../../view/servise/open_sevise_view.dart';
import '../../view/servise/servise_view.dart';

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
                        builder: (context) => const ManagerAllGarages()),
                  );
                },
                child: const Text(
                  'All garages',
                  style: TextStyle(color: Color(0xff8875FF)),
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Special offers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 33,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OpenServiseView(
                                              imagePath: 'wheels.png',
                                              id: 0,
                                              garage: null,
                                              special: true,
                                              title: 'Major Service',
                                            )));
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == 0
                                      ? const Color(0xff2B9129)
                                      : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Major Service',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                          color: index == 0
                                              ? const Color(0xffffffff)
                                              : const Color(0xff8875FF),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        '39 AED',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Image.asset('assets/line.png'),
                                          Text(
                                            'was 49 AED',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: index == 0
                                                  ? const Color(0xffffffff)
                                                  : const Color(0xff7A7A7A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Service',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'General\nrepair',
                        icon: 'assets/icons/general_repair.svg',
                        id: 0,
                      ),
                      ManagerServiceButton(
                        text: 'Interval\nservice',
                        icon: 'assets/icons/interval_service.svg',
                        id: 1,
                      ),
                      ManagerServiceButton(
                        text: 'Recovery',
                        icon: 'assets/icons/recovery.svg',
                        id: 2,
                      ),
                      ManagerServiceButton(
                        text: 'Wheels and\ntires',
                        icon: 'assets/icons/general2.svg',
                        id: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ), //  text: 'General\nrepair','Interval\nservice', 'Gearbox\nrepair','Wheels','Brakes','Battery', 'AC repair', 'Wrapping &\nPPF',   text: 'Tinting', text: 'Detailing',
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Brakes',
                        icon: 'assets/icons/brakes.svg',
                        id: 4,
                      ),
                      ManagerServiceButton(
                        text: 'Battery',
                        icon: 'assets/icons/battary.svg',
                        id: 5,
                      ),
                      ManagerServiceButton(
                        text: 'AC repair',
                        icon: 'assets/icons/ac.svg',
                        id: 6,
                      ),
                      ManagerServiceButton(
                        text: 'Wrapping &\nPPF',
                        icon: 'assets/icons/ppf.svg',
                        id: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Tinting',
                        icon: 'assets/icons/tinting.svg',
                        id: 8,
                      ),
                      ManagerServiceButton(
                        text: 'Detailing',
                        icon: 'assets/icons/detaling.svg',
                        id: 9,
                      ),
                      ManagerServiceButton(
                        text: 'Insurance',
                        icon: 'assets/icons/insurance.svg',
                        id: 10,
                      ),
                      ManagerServiceButton(
                        text: 'Car Rent',
                        icon: 'assets/icons/carrent.svg',
                        id: 11,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ManagerServiceButton(
                        text: 'Storage',
                        icon: 'assets/icons/storage.svg',
                        id: 12,
                      ),
                      SizedBox(
                        width: 72,
                      ),
                      SizedBox(
                        width: 72,
                      ),
                      SizedBox(
                        width: 72,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 73,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ManagerServiceButton extends StatelessWidget {
  final icon;
  final text;
  final int id;
  const ManagerServiceButton(
      {super.key, required this.text, required this.icon, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditServiceManager(
                      title: text,
                  id: id,
                    )));
      },
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xff363636),
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }
}
